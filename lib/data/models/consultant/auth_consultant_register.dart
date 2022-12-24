import 'package:e_consulting_flutter/data/models/consultant/consultants_model.dart';

class AuthConsultantRegister {
  int? status;
  late String message;
  late ConsultantsModel user;
  late String token;

  AuthConsultantRegister.fromJson(Map<String, dynamic> json, int? statusCode) {
    status = statusCode;
    message = json['message'];
    user = (json['user'] != null
        ? ConsultantsModel.fromJson(json)
        : null)!;
    token = json['token'];
  }
}
