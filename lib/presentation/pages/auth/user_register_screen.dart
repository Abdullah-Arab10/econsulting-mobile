// ignore_for_file: prefer_const_constructors


import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_states.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:validators/validators.dart';

class UserRegisterScreen extends StatelessWidget {
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var addressController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  var colors = AppColors();

  bool isEmailCorrect = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit,AuthStates>(
        listener: (context, state) {
          if(state is LoginLoadingState)
          {
            if(AuthCubit.get(context).authLogin.status)
            {

            }else
            {

            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColors.backgroundColor
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
                        const Text(
                          'REGISTER AS USER',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        defaultFormField(
                          controller: firstNameController,
                          keyboardType: TextInputType.text,
                          label: 'First Name',
                          prefix: Icons.first_page,
                          validate: (value) {
                            if(value != null && value.isEmpty){
                              showToast(
                                  text: 'first name must not be empty',
                                  state: ToastStates.ERROR
                              );
                            }
                            return null;
                          },
                          textColor: AppColors.secondaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.text,
                          label: 'Last Name',
                          prefix: Icons.last_page,
                          validate: (value) {
                            if(value != null && value.isEmpty){
                              showToast(
                                  text: 'last name must not be empty',
                                  state: ToastStates.ERROR
                              );
                            }
                            return null;
                          },
                          textColor: AppColors.secondaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: addressController,
                          keyboardType: TextInputType.text,
                          label: 'Address',
                          prefix: Icons.house_outlined,
                          validate: (value) {
                            if(value != null && value.isEmpty){
                              showToast(
                                  text: 'address must not be empty',
                                  state: ToastStates.ERROR
                              );
                            }
                            return null;
                          },
                          textColor: AppColors.secondaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.text,
                          label: 'Phone',
                          prefix: Icons.phone,
                          validate: (value) {
                            if(value != null && value.isEmpty){
                              showToast(
                                  text: 'phone must not be empty',
                                  state: ToastStates.ERROR
                              );
                            }
                            return null;
                          },
                          textColor: AppColors.secondaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email,
                          validate: (value) {
                            isEmailCorrect = isEmail(value!);
                            if(value.isEmpty){
                              showToast(
                                  text: 'email must not be empty',
                                  state: ToastStates.ERROR
                              );
                            }else if(isEmailCorrect == false)
                            {
                              showToast(
                                  text: 'gg',
                                  state: ToastStates.ERROR
                              );
                            }
                            return null;
                          },
                          textColor: AppColors.secondaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: AuthCubit.get(context).suffix,
                          validate: (value) {
                            if(value != null && value.isEmpty)
                            {
                              showToast(
                                  text: 'password must not be empty',
                                  state: ToastStates.ERROR
                              );
                            }else if(value!.length <= 5)
                            {
                              showToast(
                                text: 'ggg',
                                state: ToastStates.WARNING,
                              );
                            }
                            return null;
                          },
                          isPassword: AuthCubit.get(context).isPassword,

                          suffixPressed: (){
                            AuthCubit.get(context).changePasswordVisibility();
                          },
                          textColor: AppColors.secondaryColor,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            function: (){
                              if(formKey.currentState!.validate()){
                                AuthCubit.get(context).userRegister(
                                  first_name: firstNameController.text,
                                  last_name: lastNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  address: addressController.text,
                                  phone: phoneController.text,
                                  //image: ,
                                );
                              }
                            },
                            text: 'register',
                            background: AppColors.primaryColor,
                            textColor: AppColors.secondaryColor,
                            radius: 50,
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
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

