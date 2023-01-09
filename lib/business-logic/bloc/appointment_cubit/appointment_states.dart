import 'package:e_consulting_flutter/data/models/appointments/appointment_model.dart';
import 'package:e_consulting_flutter/data/models/vacations/vacation_model.dart';

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

class BookVacationLoadingState extends AppointmentStates {}

class BookVacationSuccessState extends AppointmentStates {
  final VacationModel vacationModel;
  BookVacationSuccessState(this.vacationModel);
}

class BookVacationErrorState extends AppointmentStates {
  final String error;
  final VacationErrorModel vacationErrorModel;
  BookVacationErrorState(this.error, this.vacationErrorModel);
}