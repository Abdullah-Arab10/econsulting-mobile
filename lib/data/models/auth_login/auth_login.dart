import 'package:e_consulting_flutter/data/models/auth_login/user_login_model.dart';

class AuthLogin
{
  late bool status;
  late String message;
  late UserData user;
  late String token;

  AuthLogin.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    user = (json['user'] != null ? UserData.fromJson(json['user']) : null)!;
    token = json['token'];
  }
}
