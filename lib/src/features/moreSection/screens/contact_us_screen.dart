import 'package:daily_devotional/src/features/moreSection/screens/contact_us_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';
import '../../../helpers/launcher_helper.dart';

class ContactUsScreen extends StatelessWidget {
  static String route = "/ContactUsScreen";

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColorFull.withOpacity(1),
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
            height: 5,
          ),

          ContactUsCardWidget(
            startText: 'Contact',
            endText: "zacch51@yahoo.com",
            onTap: () {
              LaunchHelper().launchAction('email', 'zacch51@yahoo.com');
            },
          ),
          SizedBox(
            height: 10,
          ),
          ContactUsCardWidget(
            startText: 'Prayer Request',
            endText: "zacch51@yahoo.com",
            onTap: () {
              LaunchHelper().launchAction('email', 'zacch51@yahoo.com');
            },
          ),
          SizedBox(
            height: 10,
          ),
          ContactUsCardWidget(
            startText: 'Admin',
            endText: "Info@elevivpublishing.com",
            onTap: () {
              LaunchHelper().launchAction('email', 'Info@elevivpublishing.com');
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       const CacheNetworkImageWidget(
          //         imgUrl: "",
          //         radius: 90,
          //         height: 65,
          //         width: 65,
          //       ),
          //       const SizedBox(
          //         height: 15,
          //       ),
          //       Text(
          //         "David Samuel",
          //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //             fontSize: 17,
          //             decoration: TextDecoration.none,
          //             color: AppColors.blackColor),
          //       ),
          //       Text(
          //         "Davidsamuel@gmail.com",
          //         style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //             fontSize: 14,
          //             decoration: TextDecoration.none,
          //             color: AppColors.blackLightColor),
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
        ],
      ),
    );
  }
}
