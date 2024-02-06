import 'package:daily_devotional/src/features/prayersSection/models/prayer_model.dart';
import 'package:daily_devotional/src/features/prayersSection/providers/prayer_provider.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/image_constants.dart';
import '../../../helpers/snak_bar_widget.dart';

class PrayerListCardWidget extends StatelessWidget {
  final PrayerModel prayerModel;
  final int index;

  const PrayerListCardWidget(
      {Key? key, required this.prayerModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: MediaQuery.sizeOf(context).width,
      // color: AppColors.primaryColor,
      child: Card(
        elevation: 4,
        color:
            index.isEven ? AppColors.secondaryColor : AppColors.appLightColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: prayerModel.prayerTitle.toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            color: AppColors.blackColor)),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Share.share(
                              prayerModel.prayerTitle.toString(),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageConstants.share),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Share",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 12,
                                        decoration: TextDecoration.none,
                                        color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                              text: prayerModel.prayerTitle.toString(),
                            )).whenComplete(() {
                              showSuccessSnackBarMessage(
                                  message: "Text copied to clipboard");
                            });
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageConstants.copy),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Copy",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 12,
                                        decoration: TextDecoration.none,
                                        color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Consumer<PrayerProvider>(
                            builder: (context, prayerProvider, __) {
                          return InkWell(
                            onTap: () {
                              prayerProvider.deletePrayer(
                                  prayerModel.prayerId.toString());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: AppColors.redColor.withOpacity(0.7),
                                  size: 15,
                                ),
                                // SvgPicture.asset(ImageConstants.copy),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Delete",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 12,
                                          decoration: TextDecoration.none,
                                          color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                    Text(
                      prayerModel.dateTime!.toDate().format("d-M-Y").toString(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
