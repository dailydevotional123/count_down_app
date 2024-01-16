import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';

class AboutTheAppScreen extends StatelessWidget {
  static String route = "/AboutTheAppScreen";

  const AboutTheAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  )),
              Text(
                "About The App",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: AppColors.blackColor),
              ),
              const SizedBox(
                width: 70,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Et sed odio facilisis augue rutrum commodo ipsum. Ornare tortor quam diam ridiculus. Cras enim semper enim quis pretium sem eleifend. Quis tincidunt suspendisse feugiat gravida habitant praesent. Nunc tellus mus eget lorem interdum facilisis venenatis consectetur. Suspendisse massa potenti consequat sed vel porta in at. Feugiat eget leo ut viverra molestie neque. Nulla aliquam sed dolor eleifend fames amet morbi placerat. Dis id sed commodo sit euismod proin proin. Eu ultrices scelerisque nibh in. Elementum sodales nec a habitasse. Pretium sapien eget a arcu sed donec duis. Nunc accumsan praesent leo ac orci est sem integer. Sollicitudin non euismod et lectus quam et elementum feugiat.",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: AppColors.blackLightColor),
                ),
              ),
            ),
          ),
          Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "© 2024 Countdown & Count-up.\nAll Rights Reserved",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: AppColors.blackLightColor),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
