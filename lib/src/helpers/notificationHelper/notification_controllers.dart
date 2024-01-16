import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../commonServices/hive_local_storage.dart';
import '../../constants/hive_constants.dart';
import '../../routing/routes.dart';
import '../../utils/log_utils.dart';

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  /// Use this method to detect every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  /// Use this method to detect if the user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  /// Use this method to detect when the user taps on a notification or action button
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    dp(msg: "received action", arg: receivedAction.title.toString());
    dp(msg: "buttonKeyInput", arg: receivedAction.buttonKeyInput.toString());
    dp(
        msg: "buttonKeyPressed",
        arg: receivedAction.buttonKeyPressed.toString());
    dp(msg: "category", arg: receivedAction.category.toString());
    dp(msg: "body", arg: receivedAction.body.toString());
    dp(msg: "payload", arg: receivedAction.payload);
    debugPrint('onActionReceivedMethod');
    String currentRoute = await HiveLocalStorage.readHiveValue<String>(
          boxName: HiveConstants.currentRouteBox,
          key: HiveConstants.currentRouteKey,
        ) ??
        '';

    // if (currentRoute == PatientBottomNavScreen.route) {
    //   GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context).push(
    //       PatientNotificationScreen.route,
    //       extra: {TextUtils.isHome: true});
    // } else if (currentRoute == ClinicBottomNavScreen.route) {
    //   GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context).push(
    //       ClinicNotificationScreen.route,
    //       extra: {TextUtils.isHome: true});
    // } else if (currentRoute == DoctorBottomNavScreen.route) {
    //   GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context).push(
    //       DoctorNotificationScreen.route,
    //       extra: {TextUtils.isHome: true});
    // }

    // final payload = receivedAction.payload ?? {};
    // if (payload["navigate"] == "true") {}
  }
}
