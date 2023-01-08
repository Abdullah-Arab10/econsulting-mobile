// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_consulting_flutter/presentation/pages/auth/consultant_register_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/register_type_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(
                'Want to know',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'what',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: AppColors.successColor,
                    radius: 37.5,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image(
                        height: 70,
                        image: AssetImage('assets/images/picture_2.png'),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 75,
                    width: 167,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: AppColors.pinkColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(50),
                        bottomStart: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          height: 70,
                          image: AssetImage('assets/images/picture_4.png'),
                        ),
                        Image(
                          height: 70,
                          image: AssetImage('assets/images/picture_3.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 75,
                  width: 167,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(50),
                      bottomEnd: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        height: 70,
                        image: AssetImage('assets/images/picture_5.png'),
                      ),
                      Image(
                        height: 70,
                        image: AssetImage('assets/images/picture_6.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'experts',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 16
              ),
              child: Text(
                'say?',
                style: TextStyle(
                    fontSize: 50, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 80
                      ),
                      child: SizedBox(
                        height: 175,
                        width: 280,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundColor: AppColors.purpleColor,
                                radius: 75,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Image(
                                    height: 140,
                                    image: AssetImage('assets/images/picture_1.png'),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 90,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.backgroundColor,
                                      AppColors.backgroundColor.withOpacity(.3)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Just book',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 60
                      ),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: MaterialButton(
                          onPressed: () {
                            navigateTo(context, RegisterTypeScreen());
                          },
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: AppColors.backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(16),
              child: Row(
                children: [
                  Text(
                    'Have an account?',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      navigateTo(context, LoginScreen());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
