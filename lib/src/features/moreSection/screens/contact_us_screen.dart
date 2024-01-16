import 'package:flutter/material.dart';

import '../../../commonWidgets/cacheNetworkImageWidget.dart';
import '../../../constants/appcolors.dart';

class ContactUsScreen extends StatelessWidget {
  static String route = "/ContactUsScreen";

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Contact Us",
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CacheNetworkImageWidget(
                  imgUrl: "",
                  radius: 90,
                  height: 65,
                  width: 65,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "David Samuel",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      decoration: TextDecoration.none,
                      color: AppColors.blackColor),
                ),
                Text(
                  "Davidsamuel@gmail.com",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                      decoration: TextDecoration.none,
                      color: AppColors.blackLightColor),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 140,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.blackLightColor.withOpacity(0.2)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: AppColors.blackLightColor,
                        ),
                        Text(
                          "Davidsamuel@gmail.com",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: AppColors.blackLightColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.blackLightColor,
                        ),
                        Container(
                          width: 200,
                          child: RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              text:
                                  "3891 Ranchview Dr. Richardson, California 62639",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      color: AppColors.blackLightColor),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
