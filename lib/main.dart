import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:daily_devotional/src/helpers/notificationHelper/notification_service.dart';
import 'package:daily_devotional/src/myApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize the Firebase app
  await Firebase.initializeApp();

  // Create a notification using the data sent with the message
  NotificationsConfiguration().createNotification(
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
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  AwesomeNotifications().initialize(
    'resource://drawable/logo',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        importance: NotificationImportance.High,
        // importance: NotificationImportance.High,
        //channelShowBadge: true,
        locked: false,
        playSound: true,
        enableLights: true,
        // criticalAlerts: true,
        channelDescription: 'basic_channel',
      ),
    ],
  ).then((value) => print(value));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}
