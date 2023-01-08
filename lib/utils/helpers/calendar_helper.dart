// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'dart:convert';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  // final String title;
  final String appointmentStart;
  final String appointmentEnd;
  final String firstName;
  final String lastName;
  final String image;
  const Event(this.appointmentStart, this.appointmentEnd, this.firstName,
      this.lastName, this.image);

  // @override
  // String toString() => title;
}

// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
);

late Map<String, dynamic> appointments;
void initAppointmentsCalendar(id) async {
  var response = await DioHelper.getData(url: 'appointment/get-appointments/$id');
  appointments = json.decode(response.toString());
  print("init calendar work ");
  List keys = appointments.keys.toList();
  keys.forEach(
    (element) {
      var appointmentDetails = appointments[element];
      kEvents[DateTime.parse(element)] = List.generate(
        appointments[element].length,
        (index) => Event(
            appointmentDetails.elementAt(index)['appointment_start'],
            appointmentDetails.elementAt(index)['appointment_end'],
            appointmentDetails.elementAt(index)['first_name'],
            appointmentDetails.elementAt(index)['last_name'],
            appointmentDetails.elementAt(index)['image']),
      );
    },
  );
  print("init calendar finish ");
  // print(kEvents);
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
