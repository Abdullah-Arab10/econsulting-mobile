class CalendarModel {
  late dynamic appointment;

  CalendarModel();

  CalendarModel.fromJson(Map<String, dynamic> json) {
    appointment = (json != null ? appointment.fromJson(json) : null)!;
  }
}
