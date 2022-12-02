import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const colors = AppColors();
  static ThemeData themeData() {
    return ThemeData(
        fontFamily: 'Glory',
        primaryColor: colors.primaryColor,
        scaffoldBackgroundColor: colors.backgroundColor,
        cardColor: colors.backgroundColor,
        backgroundColor: colors.backgroundColor,
        textTheme: TextTheme(
          headline1: TextStyle(color: colors.secondaryColor),
          subtitle1: TextStyle(color: colors.secondaryColor),
          headline2: TextStyle(color: colors.secondaryColor),
          bodyText2: TextStyle(color: colors.secondaryColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // <-- Radius
            ),
          ),
        ),
        appBarTheme: AppBarTheme(color: colors.primaryColor));
  }

  AppTheme();
}
