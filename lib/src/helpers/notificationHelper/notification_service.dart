import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../utils/log_utils.dart';
import 'notification_controllers.dart';



class NotificationsConfiguration {
  requestNotificationPermission() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  Future<void> createNotification({
    required String title,
    required String body,
    required String type,
    final List<NotificationActionButton>? actionButtons,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final Map<String, String>? payload,
  }) async {
    await AwesomeNotifications().createNotification(
      actionButtons: actionButtons,
      content: NotificationContent(
          autoDismissible: false,
          id: 1,
          category: NotificationCategory.Message,
          channelKey: 'basic_channel',
          notificationLayout: NotificationLayout.Messaging,
          title: title,
          summary: "",
          actionType: ActionType.Default,
          payload: payload,
          body: body),
    );
  }

  callNotifications() {
    FirebaseMessaging.onMessage.listen((message) {
      dp(msg: "message object", arg: message.data.toString());
      dp(msg: "title", arg: message.notification!.title);
      dp(msg: "body", arg: message.notification!.body);

      // if (message.data["notification_type"] == "shift") {
      //
      // }

      createNotification(
          title: message.notification!.title.toString(),
          body: message.notification!.body.toString(),
          notificationLayout: NotificationLayout.Inbox,
          type: message.data["notification_type"].toString(),
          actionButtons: [
            // NotificationActionButton(
            //     key: 'check',
            //     label: 'Check it out',
            //     actionType: ActionType.SilentAction,
            //     color: Colors.green,
            //     enabled: true)
          ]);
      // _handleNotificationClick(context, message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // toNext(context: context, widget: AllComingDuties());
      dp(msg: "message object", arg: message.toString());
      dp(msg: "title", arg: message.notification!.title);
      dp(msg: "body", arg: message.notification!);

      createNotification(
          title: message.notification!.title.toString(),
          body: message.notification!.body.toString(),
          notificationLayout: NotificationLayout.Inbox,
          type: message.data["notification_type"].toString(),
          actionButtons: [
            // NotificationActionButton(
            //     key: 'check',
            //     label: 'Check it out',
            //     actionType: ActionType.SilentAction,
            //     color: Colors.green,
            //     enabled: true)
          ]);
      //_handleMessage(message);

      //_handleNotificationClick(context, message);
    });
  }

  setListeners() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }
}
