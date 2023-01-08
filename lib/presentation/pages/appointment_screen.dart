// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_states.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'home_layout/home_layout_screen.dart';

class AppointmentScreen extends StatelessWidget {
  final int id;
  AppointmentScreen(this.id);

  var dateController = TextEditingController();

  var shiftStartController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isEmailCorrect = false;

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return BlocProvider(
      create: (context) => AppointmentCubit(),
      child: BlocConsumer<AppointmentCubit, AppointmentStates>(
        listener: (context, state) {
          if (state is BookAppointmentSuccessState) {
            if (state.appointmentModel.status == 200) {
              showToast(
                  text: t.appointmentCreatedSuccessfully,
                  state: ToastStates.SUCCESS);
              navigateTo(context, HomeLayoutScreen());
            }
          } else if (state is BookAppointmentErrorState) {
            if (state.appointmentErrorModel.errorId == 0) {
              showToast(text: t.consultantNotFound, state: ToastStates.ERROR);
            }
            if (state.appointmentErrorModel.errorId == 1) {
              showToast(text: t.userNotFound, state: ToastStates.ERROR);
            }
            if (state.appointmentErrorModel.errorId == 2) {
              showToast(
                  text: t.consultantNotAvailable, state: ToastStates.ERROR);
            }
            if (state.appointmentErrorModel.errorId == 3) {
              showToast(
                  text: t.youHaveAnotherAppointmentError,
                  state: ToastStates.ERROR);
            }
            if (state.appointmentErrorModel.errorId == 4) {
              showToast(
                  text: t.youHaveNoEnoughCashError, state: ToastStates.ERROR);
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
                            image: AssetImage('assets/images/appointment.png'),
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
                                // DateTime.parse(DateFormat.yMd('en')
                                //   .format(DateTime.now()))
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
                          controller: shiftStartController,
                          keyboardType: TextInputType.text,
                          label: t.appointmentStart,
                          prefix: Icons.watch_later_outlined,
                          validate: (value) {
                            if (value != null && value.isEmpty) {
                              showToast(
                                  text: t.timeRequired,
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
                            print(shiftStartController.text);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! BookAppointmentLoadingState,
                          builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  AppointmentCubit.get(context).bookAppointment(
                                      date: dateController.text,
                                      start: shiftStartController.text,
                                      consultantId: id,
                                      clientId:
                                          BlocProvider.of<AuthCubit>(context)
                                              .authLogin
                                              .user
                                              .id);
                                }
                              },
                              text: t.book,
                              radius: 50,
                              color: AppColors.primaryColor),
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
