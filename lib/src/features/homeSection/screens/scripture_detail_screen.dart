import 'package:daily_devotional/src/features/homeSection/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';
import '../widgets/scripture_card_widget.dart';

class ScriptureDetailScreen extends StatelessWidget {
  static String route = "/ScriptureDetailScreen";
  final DevotionalModel devotionalModel;

  const ScriptureDetailScreen({Key? key, required this.devotionalModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Theme of the day",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: AppColors.blackLightColor),
                  ),
                  Text(
                    devotionalModel.theme.toString(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 22,
                        decoration: TextDecoration.none,
                        color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ScriptureCardWidget(
              devotionalModel: devotionalModel,
            ),
            const SizedBox(
              height: 20,
            ),
            // PrayerCardWidget(
            //   devotionalModel: devotionalModel,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ActionCardWidget(devotionalModel: devotionalModel),
            // const SizedBox(
            //   height: 30,
            // ),
          ],
        ),
      ),
    );
  }
}
