// ignore_for_file: prefer_const_constructors
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_states.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/home_layout_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VacationScreen extends StatelessWidget {

  var dateController = TextEditingController();

  var vacationStartController = TextEditingController();

  var vacationEndController = TextEditingController();

  var repeatController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isEmailCorrect = false;

  late int repeat;

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return BlocProvider(
      create: (context) => AppointmentCubit(),
      child: BlocConsumer<AppointmentCubit, AppointmentStates>(
        listener: (context, state) {
          if (state is BookVacationSuccessState) {
            if (state.vacationModel.status == 200) {
              showToast(
                  text: t.vacationCreatedSuccessfully,
                  state: ToastStates.SUCCESS);
              HomeCubit.get(context).currentIndex = 0;
              navigateAndFinish(context, HomeLayoutScreen());
            }
          } else if (state is BookVacationErrorState) {
            print(state.vacationErrorModel.errorId);
            if (state.vacationErrorModel.errorId == 0) {
              showToast(text: t.consultantNotFound, state: ToastStates.ERROR);
            }
            if (state.vacationErrorModel.errorId == 1) {
              showToast(text: t.addVacationInYourWorkShifts, state: ToastStates.ERROR);
            }
            if (state.vacationErrorModel.errorId == 2) {
              showToast(
                  text: t.upcomingVacationInTheSameTime, state: ToastStates.ERROR);
            }
            if (state.vacationErrorModel.errorId == 3) {
              showToast(
                  text: t.upcomingAppointments,
                  state: ToastStates.ERROR);
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
                  statusBarColor: AppColors.backgroundColor),
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
                            image: AssetImage('assets/images/vacation.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        defaultFormField(
                            controller: dateController,
                            label: t.date,
                            prefix: Icons.calendar_today,
                            validate: (value) {
                              if (value!.isEmpty) {
                                showToast(
                                    text: t.dateRequired,
                                    state: ToastStates.ERROR);
                              }
                              return null;
                            },
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2024-12-31'),
                              ).then((value) {
                                var formattedDate =
                                DateFormat.yMd('en').format(value!);
                                dateController.text = formattedDate;
                              });
                              print(dateController.text);
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: vacationStartController,
                          keyboardType: TextInputType.text,
                          label: t.vacationStart,
                          prefix: Icons.watch_later_outlined,
                          validate: (value) {
                            if (value != null && value.isEmpty) {
                              showToast(
                                  text: t.vacationStartRequired,
                                  state: ToastStates.ERROR);
                            }
                            return null;
                          },
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              vacationStartController.text =
                                  value!.format(context).toString();
                            });
                            print(vacationStartController.text);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: vacationEndController,
                          keyboardType: TextInputType.text,
                          label: t.vacationEnd,
                          prefix: Icons.watch_later_outlined,
                          validate: (value) {
                            if (value != null && value.isEmpty) {
                              showToast(
                                  text: t.vacationEndRequired,
                                  state: ToastStates.ERROR);
                            }
                            return null;
                          },
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              vacationEndController.text =
                                  value!.format(context).toString();
                            });
                            print(vacationEndController.text);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: repeatController,
                          keyboardType: TextInputType.number,
                          label: t.repeat,
                          prefix: Icons.repeat,
                          validate: (value) {
                            if (value!.isEmpty) {
                              repeat = 0;
                            }else if(value.isCaseInsensitiveContainsAny('-') ||
                                value.isCaseInsensitiveContainsAny(',') ||
                                value.isCaseInsensitiveContainsAny('.')
                            )
                            {
                              showToast(
                                  text: t.repeatRequired,
                                  state: ToastStates.ERROR);
                            }else if(value.hashCode.bitLength >= 0)
                            {
                              repeat = value.hashCode.bitLength;
                            }
                            return null;
                          },
                          onChange: (value)
                          {

                            print(value);
                          }
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  AppointmentCubit.get(context).bookVacation(
                                      date: dateController.text,
                                    vacationStart: vacationStartController.text,
                                    vacationEnd: vacationEndController.text,
                                    consultantId: BlocProvider.of<AuthCubit>(context).authLogin.user.id,
                                    repeat: repeat,
                                      );
                                }
                              },
                              text: t.takeVacation,
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
