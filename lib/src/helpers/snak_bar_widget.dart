import 'package:flutter/material.dart';

import '../constants/appcolors.dart';
import '../routing/routes.dart';

showSuccessSnackBarMessage({required String message}) {
  ScaffoldMessenger.of(RoutesUtils.cNavigatorState.currentState!.context)
      //  ..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      backgroundColor: AppColors.greenColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        style: Theme.of(RoutesUtils.cNavigatorState.currentState!.context)
            .textTheme
            .displayMedium!
            .copyWith(
                overflow: TextOverflow.visible,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 12),
        //  overflow: TextOverflow.visible,
      ),
    ),
  );
}

showErrorSnackBarMessage({required String message}) {
  ScaffoldMessenger.of(RoutesUtils.cNavigatorState.currentState!.context)
      //..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      behavior: SnackBarBehavior.floating,
      //clipBehavior: Clip.none,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        style: Theme.of(RoutesUtils.cNavigatorState.currentState!.context)
            .textTheme
            .displayMedium!
            .copyWith(
                overflow: TextOverflow.visible,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 12),
        // overflow: TextOverflow.visible,
      ),
    ),
  );
}

showSnackBarMessageXc({
  required String message,
}) {
  ScaffoldMessenger.of(RoutesUtils.cNavigatorState.currentState!.context)
      // ..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      backgroundColor: AppColors.blackColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        style: Theme.of(navstate.currentState!.context)
            .textTheme
            .displayMedium!
            .copyWith(
                overflow: TextOverflow.visible,
                color: AppColors.whiteColor,
                fontSize: 15),
        // overflow: TextOverflow.visible,
      ),
    ),
  );
}

// showAwesomeDialog(
//     {required String message,
//     required String titleMessage,
//     required DialogType dialogType,
//     required Function() btnOkOnPress}) {
//   AwesomeDialog(
//       context: RoutesUtils.cNavigatorState.currentState!.context,
//       dialogType: dialogType,
//       animType: AnimType.topSlide,
//       title: titleMessage,
//       desc: message,
//       descTextStyle: Theme.of(RoutesUtils.cNavigatorState.currentState!.context)
//           .textTheme
//           .titleMedium!
//           .copyWith(fontSize: 14),
//
//       // btnCancelOnPress: () {},
//       btnOkColor: AppColors.lightBlue,
//       btnOkOnPress: btnOkOnPress)
//     ..show();
// }
