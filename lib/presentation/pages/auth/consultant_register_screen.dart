// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_states.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/login_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/change_profile_image.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_dropdown_button_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/select_consultations.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:e_consulting_flutter/utils/helpers/images_converter_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

class ConsultantRegisterScreen extends StatelessWidget {
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var addressController = TextEditingController();

  var phoneController = TextEditingController();

  var shiftStartController = TextEditingController();

  var shiftEndController = TextEditingController();

  var bioController = TextEditingController();

  var skillController = TextEditingController();

  var appointmentCost = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  var colors = AppColors();

  bool isEmailCorrect = false;

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    List<String> consultations = [
      t.doctor,
      t.dentist,
      t.therapist,
      t.lawyer,
      t.economic,
      t.softwareEngineer,
      t.civilEngineer
    ];
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is ConsultantRegisterSuccessState) {
          if(state.authConsultantRegister.status == 200)
          {
            showToast(
                text: t.registerSuccessfully,
                state: ToastStates.SUCCESS);
            navigateAndFinish(context, LoginScreen());
          }
        }else if(state is ConsultantRegisterErrorState) {
          showToast(text: t.emailOrPasswordError, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        File? profileImage = AuthCubit.get(context).profileImage;
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
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  // image: new DecorationImage(
                                  //     fit: BoxFit.cover,
                                  //     image: testGetImage(),
                                  //     scale: 0.5),
                                  ),
                            ),
                            CircleAvatar(
                              radius: 80,
                              backgroundColor: AppColors.primaryColor,
                            ),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                    radius: 77,
                                    backgroundImage:
                                        changeProfileImage(context)),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.primaryColor,
                                  child: IconButton(
                                    color: AppColors.backgroundColor,
                                    onPressed: () {
                                      AuthCubit.get(context).getProfileImage();
                                    },
                                    icon: Icon(Icons.camera_alt),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultFormField(
                              controller: firstNameController,
                              keyboardType: TextInputType.text,
                              label: t.firstName,
                              prefix: Icons.first_page,
                              validate: (value) {
                                if (value != null && value.isEmpty) {
                                  showToast(
                                      text: t.firstNameRequired,
                                      state: ToastStates.ERROR);
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: defaultFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.text,
                              label: t.lastName,
                              prefix: Icons.last_page,
                              validate: (value) {
                                if (value != null && value.isEmpty) {
                                  showToast(
                                      text: t.lastNameRequired,
                                      state: ToastStates.ERROR);
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
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
                            showToast(text: t.emailFormat, state: ToastStates.ERROR);
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
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
                        height: 16,
                      ),
                      defaultFormField(
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        label: t.address,
                        prefix: Icons.house_outlined,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        label: t.phone,
                        prefix: Icons.phone,
                        validate: (value) {
                          if (value != null && value.isEmpty) {
                            showToast(
                                text: t.phoneRequired,
                                state: ToastStates.ERROR);
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultFormField(
                              controller: shiftStartController,
                              keyboardType: TextInputType.text,
                              label: t.shiftStart,
                              prefix: Icons.calendar_today_outlined,
                              validate: (value) {
                                if (value != null && value.isEmpty) {
                                  showToast(
                                      text: t.shiftStartRequired,
                                      state: ToastStates.ERROR);
                                }
                                return null;
                              },
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  shiftStartController.text =
                                      value!.format(context).toString();
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: defaultFormField(
                              controller: shiftEndController,
                              keyboardType: TextInputType.text,
                              label: t.shiftEnd,
                              prefix: Icons.calendar_today_outlined,
                              validate: (value) {
                                if (value != null && value.isEmpty) {
                                  showToast(
                                      text: t.shiftEndRequired,
                                      state: ToastStates.ERROR);
                                }
                                return null;
                              },
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  shiftEndController.text =
                                      value!.format(context).toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      defaultFormField(
                        controller: bioController,
                        keyboardType: TextInputType.text,
                        label: t.bio,
                        prefix: Icons.details,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      defaultDropdownButtonFormField(
                        items: consultations,
                        label: t.selectConsultation,
                        onChange: (val) {
                          AuthCubit.get(context)
                              .changeSelectedConsultation(val);
                          return null;
                        },
                        validate: (value) {
                          if (AuthCubit.get(context).selectedConsultation ==
                              '') {
                            showToast(
                                text: t.consultationRequired,
                                state: ToastStates.ERROR);
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      defaultFormField(
                        controller: appointmentCost,
                        keyboardType: TextInputType.number,
                        label: t.appointmentCost,
                        prefix: Icons.monetization_on,
                        validate: (value) {
                          if (value != null && value.isEmpty) {
                            showToast(
                                text: t.appointmentCostRequired,
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
                              AuthCubit.get(context).consultantRegister(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                address: addressController.text,
                                phone: phoneController.text,
                                shiftStart: shiftStartController.text,
                                shiftEnd: shiftEndController.text,
                                image: profileImage,
                                bio: bioController.text,
                                skill: selectConsultations(context),
                                email: emailController.text,
                                password: passwordController.text,
                                appointmentCost: appointmentCost.hashCode.bitLength
                              );
                            }
                          },
                          text: t.register,
                          radius: 50,
                          color: AppColors.primaryColor
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
