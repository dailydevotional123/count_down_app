import 'package:daily_devotional/src/constants/image_constants.dart';
import 'package:daily_devotional/src/features/authenticationSection/screens/sign_in_screen.dart';
import 'package:daily_devotional/src/features/bottomNavBarSection/screens/bottomNavScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../commonServices/hive_local_storage.dart';
import '../../../constants/appcolors.dart';
import '../../../constants/hive_constants.dart';

class SplashScreen extends StatefulWidget {
  static String route = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkRoute();
    super.initState();
  }

  checkRoute() async {
    String currentRoute = await HiveLocalStorage.readHiveValue<String>(
          boxName: HiveConstants.currentRouteBox,
          key: HiveConstants.currentRouteKey,
        ) ??
        '';
    // setState(() {
    //   currentSplashRouteVar = currentRoute;
    // });
    // dp(msg: "current route", arg: currentSplashRouteVar.toString());

    // currentRouteVar = currentRoute;
    // String currentSplashRoute = await HiveLocalStorage.readHiveValue<String>(
    //       boxName: HiveConstants.currentSplashRouteBox,
    //       key: HiveConstants.currentSplashRouteKey,
    //     ) ??
    //     '';
    // currentSplashRouteVar = currentSplashRoute;
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      // if (currentSplashRoute == SplashScreen.route) {
      if (currentRoute == BottomNavScreen.route) {
        GoRouter.of(context).go(BottomNavScreen.route);
      } else {
        GoRouter.of(context).go(SignInScreen.route);
      }
      // } else {
      //   GoRouter.of(context).go(SplashScreen.route);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImageConstants.splashbac))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageConstants.applogo),
              ],
            )
          ],
        ),
      ),
    );
  }
}
