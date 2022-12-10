import 'package:e_consulting_flutter/data/models/consultant/consultants_model.dart';

class AuthConsultantRegister {
  late bool status;
  late String message;
  late ConsultantsModel user;
  late String token;

  AuthConsultantRegister.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = (json['user'] != null
        ? ConsultantsModel.fromJson(json['data'])
        : null)!;
    token = json['token'];
  }
}
