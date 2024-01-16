import 'package:daily_devotional/src/features/authenticationSection/models/userModel.dart';
import 'package:daily_devotional/src/features/authenticationSection/providers/authentication_provider.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/authServices.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/userServices.dart';
import 'package:daily_devotional/src/features/moreSection/screens/about_the_app_screen.dart';
import 'package:daily_devotional/src/features/moreSection/screens/contact_us_screen.dart';
import 'package:daily_devotional/src/features/moreSection/screens/resources_screen.dart';
import 'package:daily_devotional/src/features/moreSection/widgets/moreSettingsWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
  FirebaseUserServices firebaseUserServices = FirebaseUserServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamProvider.value(
            value: firebaseUserServices
                .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
            initialData: UserModel(),
            builder: (context, child) {
              UserModel model = context.watch<UserModel>();
              return model.userId == null
                  ? const Center(
                      child: SpinKitSpinningLines(
                        color: AppColors.primaryColor,
                        size: 45,
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "More Features",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
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
                              CacheNetworkImageWidget(
                                imgUrl: model.profilePicture.toString(),
                                radius: 90,
                                height: 45,
                                width: 45,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.userName.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15,
                                            decoration: TextDecoration.none,
                                            color: AppColors.blackColor),
                                  ),
                                  Text(
                                    model.emailAdress.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
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
                              MoreSettingsWidget(
                                  text: "Notification Settings", onTap: () {}),
                              MoreSettingsWidget(
                                  text: "Question and Prayer Request",
                                  onTap: () {}),
                              MoreSettingsWidget(
                                  text: "Contact Us",
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(ContactUsScreen.route);
                                  }),
                              MoreSettingsWidget(
                                  text: "Resources",
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(ResourcesScreen.route);
                                  }),
                              MoreSettingsWidget(
                                  text: "About the App",
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(AboutTheAppScreen.route);
                                  }),
                              Consumer<AuthenticationProvider>(builder:
                                  (context, authenticationProvider, __) {
                                return MoreSettingsWidget(
                                  text: "Log Out",
                                  onTap: () {
                                    authenticationProvider.logoutFromApp();
                                  },
                                  color: AppColors.redColor,
                                );
                              })
                            ],
                          ),
                        )
                      ],
                    );
            }));
  }
}
