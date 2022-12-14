// ignore_for_file: prefer_const_constructors


import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_states.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/presentation/pages/admin/admin_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/register_type_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/home_layout_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:e_consulting_flutter/utils/helpers/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  var colors = AppColors();

  bool isEmailCorrect = false;

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          HomeDataModel.doctors = [];
          HomeDataModel.dentists = [];
          HomeDataModel.therapists = [];
          HomeDataModel.lawyers = [];
          HomeDataModel.economists = [];
          HomeDataModel.software_engineers = [];
          HomeDataModel.civil_engineers = [];
          if (state.authLogin.status == 200) {
            if (state.authLogin.user.role == 1 ||
                state.authLogin.user.role == 2) {
              HomeCubit.get(context).getHomeData(context);
              HomeCubit.get(context).currentIndex = 0;
              navigateAndFinish(context, HomeLayoutScreen());
            } else if (state.authLogin.user.role == 0) {
              navigateAndFinish(context, AdminScreen());
            }
            showToast(text: t.loginSuccess, state: ToastStates.SUCCESS);
          }
        } else if(state is LoginErrorState) {
          showToast(text: t.emailOrPasswordError, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image(
                          height: 350,
                          image: AssetImage('assets/images/login.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      defaultFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        label: t.emailAddress,
                        prefix: Icons.email,
                        validate: (value) {
                          isEmailCorrect = isEmail(value!);
                          if (value.isEmpty) {
                            showToast(
                                text: t.requiredEmail,
                                state: ToastStates.ERROR);
                          } else if (isEmailCorrect == false) {
                            showToast(
                                text: t.emailFormat, state: ToastStates.ERROR);
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        label: t.password,
                        prefix: Icons.lock,
                        suffix: AuthCubit.get(context).suffix,
                        validate: (value) {
                          if (value != null && value.isEmpty) {
                            showToast(
                                text: t.requiredPassword,
                                state: ToastStates.ERROR);
                          } else if (value!.length <= 5) {
                            showToast(
                              text: t.passwordMin,
                              state: ToastStates.WARNING,
                            );

                          }
                          return null;
                        },
                        isPassword: AuthCubit.get(context).isPassword,
                        suffixPressed: () {
                          AuthCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                AuthCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: t.login,
                            radius: 50,
                            color: AppColors.primaryColor
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            t.account,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                          defaultTextButton(
                            function: () {
                              navigateTo(context, RegisterTypeScreen());
                            },
                            text: t.registerNow,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
