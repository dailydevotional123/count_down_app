import 'package:daily_devotional/src/features/authenticationSection/services/authServices.dart';
import 'package:daily_devotional/src/features/moreSection/screens/about_the_app_screen.dart';
import 'package:daily_devotional/src/features/moreSection/screens/contact_us_screen.dart';
import 'package:daily_devotional/src/features/moreSection/screens/resources_screen.dart';
import 'package:daily_devotional/src/features/moreSection/widgets/moreSettingsWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../commonWidgets/cacheNetworkImageWidget.dart';
import '../../../constants/appcolors.dart';

class MoreScreen extends StatefulWidget {
  static String route = "/MoreScreen";

  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "More Features",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: AppColors.blackColor),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const CacheNetworkImageWidget(
                  imgUrl: "",
                  radius: 90,
                  height: 45,
                  width: 45,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "David Samuel",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      "Davidsamuel@gmail.com",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: AppColors.blackLightColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                MoreSettingsWidget(text: "Notification Settings", onTap: () {}),
                MoreSettingsWidget(
                    text: "Question and Prayer Request", onTap: () {}),
                MoreSettingsWidget(
                    text: "Contact Us",
                    onTap: () {
                      GoRouter.of(context).push(ContactUsScreen.route);
                    }),
                MoreSettingsWidget(
                    text: "Resources",
                    onTap: () {
                      GoRouter.of(context).push(ResourcesScreen.route);
                    }),
                MoreSettingsWidget(
                    text: "About the App",
                    onTap: () {
                      GoRouter.of(context).push(AboutTheAppScreen.route);
                    }),
                MoreSettingsWidget(
                  text: "Log Out",
                  onTap: () {
                    firebaseAuthServices.logoutUser();
                  },
                  color: AppColors.redColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
