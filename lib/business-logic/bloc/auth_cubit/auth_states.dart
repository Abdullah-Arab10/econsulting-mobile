import 'package:e_consulting_flutter/data/models/auth/auth_login.dart';
import 'package:e_consulting_flutter/data/models/consultant/auth_consultant_register.dart';
import 'package:e_consulting_flutter/data/models/user/auth_user_register.dart';

abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class LoginLoadingState extends AuthStates{}

class LoginSuccessState extends AuthStates{

  final LoginModel authLogin;
  LoginSuccessState(this.authLogin);
}

class LoginErrorState extends AuthStates
{
  final String error;
  final LoginModel authLogin;
  LoginErrorState(this.error,this.authLogin);
}

class ConsultantRegisterLoadingState extends AuthStates{}

class ConsultantRegisterSuccessState extends AuthStates{

  final AuthConsultantRegister authConsultantRegister;
  ConsultantRegisterSuccessState(this.authConsultantRegister);
}

class ConsultantRegisterErrorState extends AuthStates
{
  final String error;

  ConsultantRegisterErrorState(this.error);
}

class UserRegisterLoadingState extends AuthStates{}

class UserRegisterSuccessState extends AuthStates{

  final AuthUserRegister authUserRegister;
  UserRegisterSuccessState(this.authUserRegister);
}

class UserRegisterErrorState extends AuthStates
{
  final String error;

  UserRegisterErrorState(this.error);
}

class ChangePasswordVisibilityState extends AuthStates{}

class ChangeSelectedConsultationState extends AuthStates{}

class ConsultantProfileImageSuccessState extends AuthStates{}

class ConsultantProfileImageErrorState extends AuthStates{}