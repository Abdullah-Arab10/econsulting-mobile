// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  required Color background,
  required Color textColor,
  double radius = 0.0,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
}) =>
    Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) => TextButton(
  onPressed: function,
  child: Text(
    text,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),
  ),
);
