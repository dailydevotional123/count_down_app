import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';
import '../../../helpers/calculate_day_helper.dart';

class CountDownWidget extends StatelessWidget {
  const CountDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 100,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.primaryColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              text: TextSpan(
                children: [
                  // TextSpan(
                  //     text:
                  //         "Today is ${DateTime.now().format("M-d")}, Day ${CalculateDayHelper.getDayOfYear()}, in year 2024, ",
                  //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  //         fontSize: 25,
                  //         decoration: TextDecoration.none,
                  //         color: AppColors.blackColor)),
                  TextSpan(
                      text:
                          "There are ${CalculateDayHelper.getRemainingDaysInYear()} more days remaining in year ${DateTime.now().year}.",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 21,
                          decoration: TextDecoration.none,
                          color: AppColors.whiteColorFull)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
