// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultDropdownButtonFormField({
  required List<String> items,
  required String label,
  required String? Function(String?) validate,
  required String? Function(String?) onChange,
  double borderWidth = 2.5,
}) => DropdownButtonFormField(
    items: items
        .map((e) => DropdownMenuItem(value: e,child: Text(e),))
        .toList(),
    onChanged: onChange,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.greyColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    ),
);