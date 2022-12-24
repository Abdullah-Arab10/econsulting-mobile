// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_states.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';

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
    print(BlocProvider.of<AuthCubit>(context).authLogin.user.id);
    return BlocProvider(
      create: (context) => AppointmentCubit(),
      child: BlocConsumer<AppointmentCubit,AppointmentStates>(
        listener: (context, state) {

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
                          keyboardType: TextInputType.emailAddress,
                          label: t.date,
                          prefix: Icons.calendar_today,
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
                            onTap: (){
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2022-12-31')
                              ).then((value) {
                                dateController.text = DateFormat.yMd().format(value!);
                              });
                              print(dateController.text);
                            }
                        ),
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
                                  text: 'money must not be empty',
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
                                  clientId: BlocProvider.of<AuthCubit>(context).authLogin.user.id
                                );
                              }
                            },
                            text: t.book,
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
