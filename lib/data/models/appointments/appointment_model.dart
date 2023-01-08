import 'dart:convert';

import 'package:dio/dio.dart';

class AppointmentModel {
  late int? status;
  late String? message;
  late int? errorId;

  AppointmentModel();

  AppointmentModel.fromJson(Map<String, dynamic> json, int? statusCode) {
    print(json);
    status = statusCode;
    message = json['message'];
    errorId = json['errorId'];
  }
}

class AppointmentErrorModel {
  late int? status;
  late String? message;
  late int? errorId;

  AppointmentErrorModel();

  AppointmentErrorModel.fromJson(String errorResponse, int? statusCode) {
    var error = json.decode(errorResponse);
    status = statusCode;
    message = error['message'];
    errorId = error['errorId'];
  }
}
