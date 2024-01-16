import 'package:daily_devotional/src/constants/image_constants.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/appcolors.dart';
import '../../bottomNavBarSection/screens/bottomNavScreen.dart';

class SignInScreen extends StatefulWidget {
  static String route = "/SignInScreen";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SocialAuthenticationServices socialAuthenticationServices =
      SocialAuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(ImageConstants.signinbac))),
      child: Column(
        children: [
          SizedBox(
            height: 85,
          ),
          SvgPicture.asset(
            ImageConstants.applogo,
            height: 50,
            width: 50,
          ),
          Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text:
                        "Your daily source of inspiration and spiritual growth.",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 28,
                        decoration: TextDecoration.none,
                        color: AppColors.whiteColorFull)),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: InkWell(
              onTap: () {
                //   socialAuthenticationServices.googleSignIn();
                GoRouter.of(context).go(BottomNavScreen.route);
              },
              child: Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColors.whiteColorFull),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageConstants.google),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Continue with Google",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                socialAuthenticationServices.logoutUserAuth();
              },
              child: const Center(
                child: Text("Logout"),
              )),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    ));
  }
}
