import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../commonWidgets/button_widget.dart';
import '../../../constants/appcolors.dart';
import '../providers/prayer_provider.dart';

class AddPrayerScreen extends StatefulWidget {
  static String route = "/AddPrayerScreen";

  const AddPrayerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPrayerScreen> createState() => _AddPrayerScreenState();
}

class _AddPrayerScreenState extends State<AddPrayerScreen> {
  TextEditingController prayerController = TextEditingController();

  //AppDataBase appDataBase = AppDataBase();

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerProvider>(builder: (context, prayerProvider, __) {
      return LoadingOverlay(
        isLoading: prayerProvider.isLoading,
        progressIndicator: SpinKitSpinningLines(
          color: AppColors.primaryColor,
          size: 40,
        ),
        child: Scaffold(
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
                    "Add Prayer",
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
                    height: 160,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: AppColors.blackLightColor.withOpacity(0.1)),
                    child: TextFormField(
                        maxLines: 7,
                        maxLength: 300,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: AppColors.blackColor),
                        controller: prayerController,
                        decoration: InputDecoration(
                          hintText: "Enter Prayer",
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(top: 13, left: 15),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: AppColors.blackLightColor),
                        ))),
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<PrayerProvider>(builder: (context, prayerProvider, __) {
                return CommonButtonWidget(
                    text: "Save Prayer",
                    horizontalPadding: 12,
                    onTap: () async {
                      prayerProvider.createPrayer(
                        prayerTitle: prayerController.text,
                      );
                    });
              })
            ],
          ),
        ),
      );
    });
  }
}
