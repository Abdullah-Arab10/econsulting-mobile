// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  required IconData prefix,
  required String? Function(String?) validate,
  Function(String?)? onChange,
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
      onChanged: onChange,
      onTap: onTap,
      obscureText: isPassword,
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
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );
