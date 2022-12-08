import 'package:e_consulting_flutter/data/models/consultant/consultants_model.dart';
import 'package:e_consulting_flutter/data/models/user/user_model.dart';

class AuthUserRegister
{
  late bool status;
  late String message;
  late UserModel user;
  late String token;

  AuthUserRegister.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    user = (json['user'] != null ? UserModel.fromJson(json['data']) : null)!;
    token = json['token'];
  }
}
