// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/helpers/material_colors_helper.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
        fontFamily: 'Gilroy',
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: buildMaterialColor(AppColors.primaryColor)),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        cardColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        textTheme: TextTheme(
          headline1: TextStyle(color: AppColors.secondaryColor),
          subtitle1: TextStyle(color: AppColors.secondaryColor),
          headline2: TextStyle(color: AppColors.secondaryColor),
          bodyText2: TextStyle(color: AppColors.secondaryColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // <-- Radius
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.secondaryColor),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
    );

  }

  AppTheme();
}
