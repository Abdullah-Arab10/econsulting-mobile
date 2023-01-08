import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_states.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';

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
    var response = await DioHelper.postData(url: 'appointment/book', data: {
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
}
