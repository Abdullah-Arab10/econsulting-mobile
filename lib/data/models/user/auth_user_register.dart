import 'package:e_consulting_flutter/data/models/consultant/consultants_model.dart';
import 'package:e_consulting_flutter/data/models/user/user_model.dart';

class AuthUserRegister
{
  int? status;
  late String message;
  late UserModel user;
  late String token;

  AuthUserRegister.fromJson(Map<String,dynamic> json, int? statusCode)
  {
    status = statusCode;
    message = json['message'];
    user = (json['user'] != null ? UserModel.fromJson(json['user']) : null)!;
    token = json['token'];
  }
}
