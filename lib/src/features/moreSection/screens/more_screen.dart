import 'package:daily_devotional/src/features/authenticationSection/models/userModel.dart';
import 'package:daily_devotional/src/features/authenticationSection/providers/authentication_provider.dart';
import 'package:daily_devotional/src/features/authenticationSection/screens/sign_in_screen.dart';
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
import '../../../helpers/launcher_helper.dart';
import '../../../routing/routes.dart';
import '../../../utils/log_utils.dart';
import '../../bottomNavBarSection/providers/bottom_navbar_provider.dart';
import '../../homeSection/screens/home_screen.dart';
import '../widgets/deactivate_dialog.dart';

class MoreScreen extends StatefulWidget {
  static String route = "/MoreScreen";

  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  FirebaseUserServices firebaseUserServices = FirebaseUserServices();

  bool switchStatus = true;

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
        if (FirebaseAuth.instance.currentUser != null) ...[
          const SizedBox(
            height: 20,
          ),
          StreamProvider.value(
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
                    : Padding(
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
                                if (model.userName == "User")
                                  ...[]
                                else ...[
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
                                ],
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
                      );
              }),
        ],
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(children: [
            MoreSettingsWidget(
              text: "Notification Settings",
              onTap: () {},
              widget: Switch(
                value: switchStatus,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  setState(() {
                    switchStatus = value;
                  });

                  // if (value == true) {
                  //   doctorProfileProvider
                  //       .getHideFromSearchStatusProvider(
                  //       "1");
                  // } else {
                  //   doctorProfileProvider
                  //       .getHideFromSearchStatusProvider(
                  //       "0");
                  // }
                  // setState(() {
                  //   _switchValue = value;
                  // });
                  dp(msg: "value", arg: value.toString());
                },
              ),
              isWidget: true,
            ),
            // MoreSettingsWidget(
            //     text: "Question and Prayer Request",
            //     onTap: () {}),
            MoreSettingsWidget(
              text: "Contact Us",
              onTap: () {
                GoRouter.of(context).push(ContactUsScreen.route);
              },
              widget: SizedBox(),
            ),
            MoreSettingsWidget(
              text: "Resources",
              onTap: () {
                GoRouter.of(context).push(ResourcesScreen.route);
              },
              widget: SizedBox(),
            ),
            if (FirebaseAuth.instance.currentUser != null) ...[
              MoreSettingsWidget(
                text: "Delete Account",
                onTap: () {
                  showGeneralDialog(
                      context:
                          RoutesUtils.cNavigatorState.currentState!.context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(
                              RoutesUtils.cNavigatorState.currentState!.context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black45,
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (BuildContext buildContext,
                          Animation animation, Animation secondaryAnimation) {
                        return DeactivateAccountDialog(
                          onYesTap: () {
                            firebaseAuthServices.deleteUser();
                            //FirebaseAuth.instance.
                            // // clinicAuthProvider
                            //      .deactivateClinicAccountProvider();
                          },
                          onNoTap: () {
                            Navigator.pop(context);
                          },
                        );
                      });
                  // GoRouter.of(context).push(ResourcesScreen.route);
                },
                widget: SizedBox(),
              ),
            ],

            MoreSettingsWidget(
              text: "Follow us on facebook",
              onTap: () {
                LaunchHelper().launchAction('web',
                    'https://www.facebook.com/profile.php?id=61556176377692&sfnsn=wa&mibextid=RUbZ1f');
                // GoRouter.of(context)
                //     .push(ResourcesScreen.route);
              },
              widget: SizedBox(),
            ),
            MoreSettingsWidget(
              text: "About the App",
              onTap: () {
                GoRouter.of(context).push(AboutTheAppScreen.route);
              },
              widget: SizedBox(),
            ),
            if (FirebaseAuth.instance.currentUser != null) ...[
              Consumer<AuthenticationProvider>(
                  builder: (context, authenticationProvider, __) {
                return MoreSettingsWidget(
                  text: "Log Out",
                  onTap: () {
                    authenticationProvider.logoutFromApp();
                  },
                  color: AppColors.redColor,
                  isWidget: false,
                  widget: SizedBox(),
                );
              })
            ] else ...[
              MoreSettingsWidget(
                text: "Log In",
                onTap: () {
                  var bottomNavProvider = Provider.of<ClinicBottomNavProvider>(
                      context,
                      listen: false);
                  bottomNavProvider.currentScreen = HomeScreen();
                  bottomNavProvider.currentIndex = 0;
                  GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
                      .go(SignInScreen.route);
                  // authenticationProvider.logoutFromApp();
                },
                color: AppColors.blackColor,
                isWidget: false,
                widget: SizedBox(),
              )
            ]
          ]),
        )
      ],
    ));
  }
}
