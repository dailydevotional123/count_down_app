import 'package:daily_devotional/src/features/authenticationSection/providers/authentication_provider.dart';
import 'package:daily_devotional/src/features/bottomNavBarSection/providers/bottom_navbar_provider.dart';
import 'package:daily_devotional/src/features/homeSection/providers/home_provider.dart';
import 'package:daily_devotional/src/features/notesSection%20/providers/notes_provider.dart';
import 'package:daily_devotional/src/features/prayersSection/providers/prayer_provider.dart';
import 'package:daily_devotional/src/routing/routes.dart';
import 'package:daily_devotional/src/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'features/homeSection/providers/text_to_audio_provider.dart';
import 'helpers/notificationHelper/notification_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    NotificationsConfiguration().requestNotificationPermission();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    NotificationsConfiguration().callNotifications();
    NotificationsConfiguration().setListeners();

    super.initState();
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

        ChangeNotifierProvider(
          create: (context) => PrayerProvider(),
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
