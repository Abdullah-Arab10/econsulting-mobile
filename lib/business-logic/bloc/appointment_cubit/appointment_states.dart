import 'package:e_consulting_flutter/data/models/appointments/appointment_model.dart';

abstract class AppointmentStates {}

class BookAppointmentInitialState extends AppointmentStates {}

class BookAppointmentLoadingState extends AppointmentStates {}

class BookAppointmentSuccessState extends AppointmentStates {
  final AppointmentModel appointmentModel;
  BookAppointmentSuccessState(this.appointmentModel);
}

class BookAppointmentErrorState extends AppointmentStates {
  final String error;
  final AppointmentErrorModel appointmentErrorModel;
  BookAppointmentErrorState(this.error, this.appointmentErrorModel);
}
