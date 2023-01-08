// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  TextEditingController? controller,
  TextInputType? keyboardType,
  required String label,
  required IconData prefix,
  String? Function(String?)? validate,
  Function(String?)? onChange,
  Function(String?)? onSubmit,
  VoidCallback? suffixPressed,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? onTap,
  double borderWidth = 2.5,
  String? initial,
  bool? enable,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validate,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      obscureText: isPassword,
      //maxLines: null,
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
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyColor,
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
      initialValue: initial,
      enabled: enable,
    );
