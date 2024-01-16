import 'package:flutter/material.dart';

import '../constants/appcolors.dart';

class AppTheme {
  ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColorFull,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green, background: AppColors.primaryColor),
      hintColor: AppColors.blackLightColor.withOpacity(0.8),
      buttonTheme: const ButtonThemeData(),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily: "Manrope",
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: AppColors.blackColor,
            letterSpacing: -0.3),
        titleMedium: TextStyle(
            fontFamily: "Manrope",
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontStyle: FontStyle.normal,
            color: AppColors.blackColor,
            letterSpacing: -0.3),
        titleSmall: TextStyle(
            fontFamily: "Manrope-Regular",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontStyle: FontStyle.normal,
            color: AppColors.blackColor,
            letterSpacing: -0.3),
      )).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
