import 'dart:io';

import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';

class DeactivateAccountDialog extends StatelessWidget {
  final VoidCallback? onYesTap;
  final VoidCallback? onNoTap;
  final String message;

  const DeactivateAccountDialog({
    Key? key,
    required this.onYesTap,
    required this.onNoTap,
    this.message = "Are you sure you want to deactivate account?",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: Platform.isAndroid
                ? 300
                : MediaQuery.of(context).size.height > 1050
                    ? MediaQuery.of(context).size.height - 800
                    : MediaQuery.of(context).size.height - 600),
        child: Container(
          width: MediaQuery.of(context).size.width - 110,
          height: Platform.isAndroid
              ? MediaQuery.of(context).size.height - 300
              : MediaQuery.of(context).size.height - 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(19),
          ),
          //padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 25,
                    // ),
                    // Image.asset(
                    //   "assets/images/accountdisable.png",
                    //   height: 85,
                    //   width: 85,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 80, right: 0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: Container(
                    //       height: 25,
                    //       width: 25,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(45),
                    //           color: AppColors.redColor),
                    //       child: Center(
                    //         child: Icon(
                    //           Icons.close,
                    //           size: 18,
                    //           color: AppColors.whiteColor,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: message),
                    ],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.height > 850 ? 20 : 13,
                        color: AppColors.blackColor),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //  Spacer(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 12),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: CommonButtomWidget(
              //             text: "Yes",
              //             onTap: onYesTap!,
              //             textcolor: AppColors.whiteColor,
              //             bordercolor: AppColors.darkAppColor,
              //             backgroundcolor: AppColors.darkAppColor,
              //             radius: 7,
              //             buttonHeight: 50,
              //             textfont: 14,
              //             horizontalPadding: 0,
              //             iconColor: AppColors.darkAppColor),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: CommonButtomWidget(
              //             text: "No",
              //             onTap: onNoTap!,
              //             textcolor: AppColors.whiteColor,
              //             bordercolor: AppColors.appColor,
              //             backgroundcolor: AppColors.appColor,
              //             radius: 7,
              //             buttonHeight: 50,
              //             textfont: 14,
              //             horizontalPadding: 0,
              //             iconColor: AppColors.appColor),
              //       ),
              //     ],
              //   ),
              // )
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onYesTap,
                      child: Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(13)),
                            color: AppColors.redColor),
                        child: Center(
                          child: Text(
                            "YES",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 14,
                                    color: AppColors.whiteColorFull),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onNoTap,
                      child: Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(13),
                            ),
                            color: AppColors.appLightColor),
                        child: Center(
                          child: Text(
                            "NO",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 14, color: AppColors.blackColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
