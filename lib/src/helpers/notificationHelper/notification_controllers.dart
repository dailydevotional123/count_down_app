import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      BuildContext context, ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      BuildContext context, ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      BuildContext context, ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      BuildContext context, ReceivedAction receivedAction) async {
    // if (receivedAction.buttonKeyPressed == "shift") {
    //   toNext(
    //       context: navstate.currentState!.context, widget: AllComingDuties());
    // } else if (receivedAction.buttonKeyPressed == "task") {
    //   toNext(context: navstate.currentState!.context, widget: AllComingTasks());
    // } else if (receivedAction.buttonKeyPressed == "announcement") {
    //   toNext(
    //       context: navstate.currentState!.context,
    //       widget: ViewAllAnnouncementScreen());
    // }

    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    // navstate.currentState!.context.pushNamedAndRemoveUntil(
    //     '/notification-page',
    //     (route) =>
    //         (route.settings.name != '/notification-page') || route.isFirst,
    //     arguments: receivedAction);
  }
}
