import 'package:e_consulting_flutter/data/models/auth/user_login_model.dart';

class LoginModel {
  late int? status;
  late String message;
  late UserData user;
  late String token;

  LoginModel();

  LoginModel.fromJson(Map<String, dynamic> json, int? statusCode) {
    status = statusCode;
    message = json['message'];
    user = (json['user'] != null ? UserData.fromJson(json['user']) : null)!;
    token = json['token'];
  }
}
