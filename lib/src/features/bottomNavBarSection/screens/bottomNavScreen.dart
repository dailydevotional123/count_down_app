import 'package:daily_devotional/src/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/appcolors.dart';
import '../providers/bottom_navbar_provider.dart';

class BottomNavScreen extends StatefulWidget {
  final int? index;
  static String route = "/BottomNavScreen";

  const BottomNavScreen({Key? key, this.index}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClinicBottomNavProvider>(builder: (context, provider, __) {
      return WillPopScope(
          onWillPop: () async {
            if (provider.currentIndex != 0) {
              provider.updateCurrentScreen(0);
              return false;
            }
            if (provider.currentIndex == 0) {
              return true;
            }
            return false;
          },
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: Consumer<ClinicBottomNavProvider>(
              builder: (context, provider, child) {
                return provider.currentScreen;
              },
            ),
            bottomNavigationBar: Consumer<ClinicBottomNavProvider>(
                builder: (context, provider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      BottomNavigationBar(
                          elevation: 0.0,
                          currentIndex: provider.currentIndex,
                          backgroundColor: AppColors.whiteColorFull,
                          selectedFontSize: 12,
                          unselectedLabelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor),
                          selectedLabelStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                          selectedItemColor: AppColors.blackColor,
                          onTap: (index) {
                            provider.updateCurrentScreen(index);
                          },
                          type: BottomNavigationBarType.fixed,
                          items: [
                            bottomNavItem(
                              path: ImageConstants.home,
                              selectedColor: provider.currentIndex == 0
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              label: "Home",
                              height: 26,
                              width: 26,
                              backgroundColor: provider.currentIndex == 0
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              //  key: tutorialProvider.bottomNavOne,
                            ),
                            bottomNavItem(
                              path: ImageConstants.bible,
                              height: 26,
                              width: 26,
                              selectedColor: provider.currentIndex == 1
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              label: "Bible",
                              backgroundColor: provider.currentIndex == 1
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              //  key: tutorialProvider.bottomNavTwo,
                            ),
                            bottomNavItem(
                              path: ImageConstants.devotion,
                              selectedColor: provider.currentIndex == 2
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              label: "Devotion",
                              height: 26,
                              width: 26,
                              backgroundColor: provider.currentIndex == 2
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              //   key: tutorialProvider.bottomNavThree,
                            ),
                            bottomNavItem(
                              path: ImageConstants.notes,
                              selectedColor: provider.currentIndex == 3
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              label: "Notes",
                              height: 26,
                              width: 26,
                              backgroundColor: provider.currentIndex == 3
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              //   key: tutorialProvider.bottomNavFour,
                            ),
                            bottomNavItem(
                              path: ImageConstants.more,
                              selectedColor: provider.currentIndex == 4
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              label: "More",
                              height: 26,
                              width: 26,
                              backgroundColor: provider.currentIndex == 4
                                  ? AppColors.blackColor
                                  : AppColors.blackLightColor,
                              //   key: tutorialProvider.bottomNavFive,
                            ),
                          ]),
                      Container(
                        height: 1,
                        width: MediaQuery.sizeOf(context).width,
                        color: AppColors.primaryLightColor.withOpacity(0.2),
                      )
                      // Positioned(
                      //   bottom: 48,
                      //   child: Image.asset(
                      //     "assets/images/bottombarpng.png",
                      //     height: 42,
                      //     fit: BoxFit.cover,
                      //     width: MediaQuery.of(context).size.width,
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  )
                ],
              );
            }),
          ));
    });
  }

  bottomNavItem({
    double? height,
    double? width,
    required Color selectedColor,
    required String path,
    required final String label,
    required Color backgroundColor,
    // required Key key,
  }) {
    return BottomNavigationBarItem(
      tooltip: "hello",
      icon: Padding(
        //   key: key,
        padding: const EdgeInsets.only(bottom: 3, top: 3),
        child: Container(
          // height: 38,
          // width: 41,
          // decoration: BoxDecoration(
          //     color: backgroundColor, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(
              path,
              height: height,
              width: width,
              color: selectedColor,
            ),
          ),
        ),
      ),
      label: label,
    );
  }
}
