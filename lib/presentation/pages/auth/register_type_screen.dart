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
            buttonRegisterType(
                onTap: () {
                  navigateTo(context, ConsultantRegisterScreen());
                },
                text1: t.registerAs,
                text2: t.consultant),
            SizedBox(
              height: 40,
            ),
            buttonRegisterType(
                onTap: () {
                  navigateTo(context, UserRegisterScreen());
                },
                text1: t.registerAsu,
                text2: t.user),
          ],
        ),
      ),
    );
  }
}

Widget buttonRegisterType({
  required VoidCallback? onTap,
  required String text1,
  required String text2,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text2,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
