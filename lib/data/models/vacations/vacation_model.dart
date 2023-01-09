import 'dart:convert';

import 'package:dio/dio.dart';

class VacationModel {
  late int? status;
  late String? message;
  late int? errorId;

  VacationModel();

  VacationModel.fromJson(Map<String, dynamic> json, int? statusCode) {
    print(json);
    status = statusCode;
    message = json['message'];
    errorId = json['errorId'];
  }
}

class VacationErrorModel {
  late int? status;
  late String? message;
  late int? errorId;

  VacationErrorModel();

  VacationErrorModel.fromJson(String errorResponse, int? statusCode) {
    var error = json.decode(errorResponse);
    status = statusCode;
    message = error['message'];
    errorId = error['errorId'];
  }
}
