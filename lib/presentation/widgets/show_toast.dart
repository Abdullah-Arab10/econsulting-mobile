import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  required ToastStates state,
}) => Fluttertoast.showToast(
msg: text,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor: changeToastColor(state),
textColor: AppColors.secondaryColor,
fontSize: 16.0
);

enum ToastStates {SUCCESS, ERROR, WARNING}

Color changeToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = AppColors.successColor;
      break;
    case ToastStates.ERROR:
      color = AppColors.errorColor;
      break;
    case ToastStates.WARNING:
      color = AppColors.yellowColor;
      break;
  }
  return color;
}

