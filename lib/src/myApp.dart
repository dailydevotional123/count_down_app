import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:daily_devotional/src/features/authenticationSection/providers/authentication_provider.dart';
import 'package:daily_devotional/src/features/bottomNavBarSection/providers/bottom_navbar_provider.dart';
import 'package:daily_devotional/src/features/homeSection/providers/home_provider.dart';
import 'package:daily_devotional/src/features/notesSection%20/notes_provider.dart';
import 'package:daily_devotional/src/routing/routes.dart';
import 'package:daily_devotional/src/utils/log_utils.dart';
import 'package:daily_devotional/src/utils/theme_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'features/homeSection/providers/text_to_audio_provider.dart';
import 'helpers/notificationHelper/notification_controllers.dart';

Future<void> createNotification(
    {required String title, required String body, required String type}) async {
  await AwesomeNotifications().createNotification(
    //schedule: NotificationSchedule(timeZone: ''),
    actionButtons: [
      NotificationActionButton(
        enabled: true,
        key: type,
        autoDismissible: false,

        label: 'View',
        requireInputText: false,
        //    actionType: ActionType.
      ),
    ],

    content: NotificationContent(
        autoDismissible: false,
        id: 1,
        category: NotificationCategory.Message,
        channelKey: 'basic_channel',
        //notificationLayout: NotificationLayout.Messaging,
        title: title,
        actionType: ActionType.Default,
        body: body),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    requestNotificationPermission();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
    FirebaseMessaging.onMessage.listen((message) {
      dp(msg: "message object", arg: message.data.toString());
      dp(msg: "title", arg: message.notification!.title);
      dp(msg: "body", arg: message.notification!.body);

      createNotification(
        title: message.notification!.title.toString(),
        body: message.notification!.body.toString(),
        type: message.data["notification_type"].toString(),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // toNext(context: context, widget: AllComingDuties());
      dp(msg: "message object", arg: message.toString());
      dp(msg: "title", arg: message.notification!.title);
      dp(msg: "body", arg: message.notification!);

      createNotification(
        title: message.notification!.title.toString(),
        body: message.notification!.body.toString(),
        type: message.data["notification_type"].toString(),
      );
    });

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) {
        return NotificationController.onActionReceivedMethod(
            navstate.currentState!.context, receivedAction);
      },
      onNotificationCreatedMethod: (ReceivedNotification receivedNotification) {
        return NotificationController.onNotificationCreatedMethod(
            navstate.currentState!.context, receivedNotification);
      },
      onNotificationDisplayedMethod:
          (ReceivedNotification receivedNotification) {
        return NotificationController.onNotificationDisplayedMethod(
            navstate.currentState!.context, receivedNotification);
      },
      onDismissActionReceivedMethod: (ReceivedAction receivedAction) {
        return NotificationController.onDismissActionReceivedMethod(
            navstate.currentState!.context, receivedAction);
      },
    );

    super.initState();
  }

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// --------------------- clinic providers --------------------
        ChangeNotifierProvider(
          create: (context) => ClinicBottomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextToAudioProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: MaterialApp.router(
          title: 'Clinic On App',
          debugShowCheckedModeBanner: false,
          routerConfig: routerConfigs,
          theme: AppTheme().themeData,
        ),
      ),
    );
  }
}
