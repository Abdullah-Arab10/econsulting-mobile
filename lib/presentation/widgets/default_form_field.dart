// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  required IconData prefix,
  required String? Function(String?) validate,
  required Color textColor,
  VoidCallback? suffixPressed,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? onTap,
  double borderWidth = 2.5,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validate,
      onTap: onTap,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 20,
          color: textColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
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
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );
