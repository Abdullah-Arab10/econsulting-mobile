// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/business-logic/bloc/admin_cubit/admin_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/admin_cubit/admin_states.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/login_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import '../../../business-logic/bloc/locale_cubit/locale_cubit.dart';

class AdminScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var moneyController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isEmailCorrect = false;

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);

    return BlocProvider(
      create: (context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminStates>(
        listener: (context, state) {
          if (state is AdminTransferSuccessState) {
            showToast(text: t.addCash, state: ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColors.backgroundColor),
            ),
            drawer: Drawer(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                if (state is ChangeLocaleState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Expanded(
                      child: Column(
                        children: [
                          Text(
                            t.applicationLanguage,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<LocaleCubit>(context)
                                    .changeLanguage('en');
                              },
                              child: Text(
                                t.english,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<LocaleCubit>(context)
                                    .changeLanguage('ar');
                              },
                              child: Text(
                                t.arabic,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      bottom: 10),
                                  child: defaultButton(
                                      text: t.logout,
                                      function: () {
                                            showToast(
                                                text: t.logoutSuccess,
                                                state: ToastStates.SUCCESS);
                                            navigateAndFinish(
                                                context, LoginScreen());
                                          },
                                      width: 200,
                                      color: AppColors.errorColor,
                                      radius: 50),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
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
                            image: AssetImage('assets/images/admin.png'),
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
                                  text: t.emailFormat,
                                  state: ToastStates.ERROR);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: moneyController,
                          keyboardType: TextInputType.number,
                          label: t.moneyAmount,
                          prefix: Icons.monetization_on,
                          validate: (value) {
                            print(value);
                            if (value != null && value.isEmpty) {
                              showToast(
                                  text: t.requiredMoney,
                                  state: ToastStates.ERROR);
                            }else if(value!.isCaseInsensitiveContainsAny('-') ||
                                value.isCaseInsensitiveContainsAny(',') ||
                                value.isCaseInsensitiveContainsAny('.')
                            )
                            {
                              showToast(
                                  text: t.repeatRequired,
                                  state: ToastStates.ERROR);
                            }else if(value == '0')
                            {
                              showToast(
                                  text: t.cashMustBeGreaterThanZero,
                                  state: ToastStates.ERROR);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  AdminCubit.get(context).adminTransfer(
                                    email: emailController.text,
                                    moneyAmount: moneyController.text,
                                  );
                                }
                              },
                              text: t.transfer,
                              radius: 50,
                              color: AppColors.primaryColor),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
