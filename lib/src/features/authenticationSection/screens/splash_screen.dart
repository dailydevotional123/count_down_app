import 'package:daily_devotional/src/constants/image_constants.dart';
import 'package:daily_devotional/src/features/authenticationSection/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/appcolors.dart';

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
    // String currentRoute = await HiveLocalStorage.readHiveValue<String>(
    //       boxName: HiveConstants.currentRouteBox,
    //       key: HiveConstants.currentRouteKey,
    //     ) ??
    //     '';
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
      GoRouter.of(context).go(SignInScreen.route);
      // if (currentSplashRoute == SplashScreen.route) {
      //   // if (currentRoute == SelectAccountTypeScreen.route) {
      //   //   GoRouter.of(context).go(SelectAccountTypeScreen.route);
      //   // } else if (currentRoute == PatientBottomNavScreen.route) {
      //   //   GoRouter.of(context).go(PatientBottomNavScreen.route);
      //   // } else if (currentRoute == SetUpYourProfileStepOne.route) {
      //   //   GoRouter.of(context).go(SetUpYourProfileStepOne.route);
      //   // } else if (currentRoute == ClinicBottomNavScreen.route) {
      //   //   GoRouter.of(context).go(ClinicBottomNavScreen.route);
      //   // } else if (currentRoute == DoctorBottomNavScreen.route) {
      //   //   GoRouter.of(context).go(DoctorBottomNavScreen.route);
      //   // } else {
      //   //   GoRouter.of(context).go(SelectAccountTypeScreen.route);
      //   // }
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
