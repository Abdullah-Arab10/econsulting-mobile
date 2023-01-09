import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_states.dart';
import 'package:e_consulting_flutter/data/models/vacations/vacation_model.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/appointments/appointment_model.dart';

class AppointmentCubit extends Cubit<AppointmentStates> {
  AppointmentCubit() : super(BookAppointmentInitialState());

  static AppointmentCubit get(context) => BlocProvider.of(context);
  late AppointmentModel appointmentModel;
  AppointmentErrorModel? appointmentErrorModel;
  void bookAppointment({
    required String date,
    required String start,
    required int consultantId,
    required int clientId,
  }) async {
    emit(BookAppointmentLoadingState());

    await DioHelper.postData(url: 'appointment/book', data: {
      'date': date,
      'appointmentStart': start,
      'consultantId': consultantId,
      'clientId': clientId
    }).then((value) {
      print(value.data);
      appointmentModel =
          AppointmentModel.fromJson(value.data, value.statusCode);
      emit(BookAppointmentSuccessState(appointmentModel));
    }).catchError((error) {
      appointmentErrorModel = AppointmentErrorModel.fromJson(
          error.response.toString(), error.response.statusCode);
      emit(BookAppointmentErrorState(error.toString(), appointmentErrorModel!));
    });
  }

  late VacationModel vacationModel;
  late VacationErrorModel vacationErrorModel;
  void bookVacation({
    required String date,
    required String vacationStart,
    required String vacationEnd,
    required int consultantId,
    required int repeat,
  }) {
    emit(BookVacationLoadingState());

    DioHelper.postData(
        url: VACATION,
        data: {
          'date' : date,
          'vacationStart' : vacationStart,
          'vacationEnd' : vacationEnd,
          'consultantId' : consultantId,
          'repeat' : repeat
        }
    ).then((value) {

      vacationModel = VacationModel.fromJson(value.data, value.statusCode);

      emit(BookVacationSuccessState(vacationModel));
    },).catchError((error)
    {
      vacationErrorModel = VacationErrorModel.fromJson(
          error.response.toString(), error.response.statusCode);
      emit(BookVacationErrorState(error.toString(), vacationErrorModel));
    });
  }
}
