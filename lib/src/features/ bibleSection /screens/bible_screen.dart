import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../constants/appcolors.dart';

class BibleScreen extends StatefulWidget {
  static String route = "/BibleScreen";

  const BibleScreen({Key? key}) : super(key: key);

  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  var loadingPercentage = 0;

  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      //..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(true)

      //..canGoBack()

      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingPercentage = progress;
            });
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://cliniconapp.net/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
        'https://www.biblegateway.com/',
      ));
    //'https://docs.google.com/document/d/1Iys8u80lCgR5MHx00BTE_6PsigFQWolXG1WsR-ctNQE/edit?usp=sharing'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: Text(
          "Bible",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.blackColor, fontSize: 14),
        ),
        centerTitle: true,
        elevation: 0,
        // leading: Padding(
        //   padding:
        //       const EdgeInsets.only(top: 17, bottom: 17, left: 12, right: 7),
        //   child: IconButton(
        //       onPressed: () {
        //         Navigator.maybePop(context);
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back_ios,
        //         size: 24,
        //       )),
        // ),
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.maybePop(context);
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 10, bottom: 10, left: 6),
        //     child: const CircleWithIconWidget(
        //       icon: "assets/images/backbutton.svg",
        //       color: AppColors.appdarkcolor,
        //     ),
        //   ),
        // ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (loadingPercentage < 100)
            Center(
              child: CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: loadingPercentage / 100.0,
                center: new Text(loadingPercentage.toString() + "%"),
                progressColor: AppColors.primaryColor,
              ),
            )
        ],
      ),
    );
  }
}
