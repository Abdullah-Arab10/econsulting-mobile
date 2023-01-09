// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/consultant_register_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/user_register_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterTypeScreen extends StatelessWidget {
  const RegisterTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.registerAs,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondaryColor),
            ),
            Image(
                height: 400,
                width: double.infinity,
                image: AssetImage('assets/images/Choice.png')),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsetsDirectional.all(33),
              child: buttonRegisterType(
                onTap: () {
                  navigateTo(context, ConsultantRegisterScreen());
                },
                text1: t.consultant,
              ),
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 33, end: 33, bottom: 33),
              child: buttonRegisterType(
                onTap: () {
                  navigateTo(context, UserRegisterScreen());
                },
                text1: t.user,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttonRegisterType({
  required VoidCallback? onTap,
  required String text1,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            text1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
