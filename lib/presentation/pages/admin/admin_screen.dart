// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/business-logic/bloc/admin_cubit/admin_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/admin_cubit/admin_states.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:validators/validators.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';

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
            showToast(
                text: 'success',
                state: ToastStates.SUCCESS);
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
                      padding: const EdgeInsets.only(
                          top:100),
                      child: ListTile(
                          leading: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<LocaleCubit>(context)
                                  .changeLanguage('en');
                            },
                            child: Text('ENGLISH'),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<LocaleCubit>(context)
                                  .changeLanguage('ar');
                            },
                            child: Text('Arabic'),
                          )
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
                                  text: 'email must not be empty',
                                  state: ToastStates.ERROR);
                            } else if (isEmailCorrect == false) {
                              showToast(text: 'gg', state: ToastStates.ERROR);
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
                            if (value != null && value.isEmpty) {
                              showToast(
                                  text: 'money must not be empty',
                                  state: ToastStates.ERROR);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! AdminTransferLoadingState,
                          builder: (context) => defaultButton(
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
                              color: AppColors.primaryColor
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
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
