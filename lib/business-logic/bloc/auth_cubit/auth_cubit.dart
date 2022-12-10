// ignore_for_file: non_constant_identifier_names

import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_states.dart';
import 'package:e_consulting_flutter/data/models/auth/auth_login.dart';
import 'package:e_consulting_flutter/data/models/consultant/auth_consultant_register.dart';
import 'package:e_consulting_flutter/data/models/user/auth_user_register.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  late LoginModel authLogin;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(url: '', data: {
      'email': email,
      'password': password,
    }).then((value) {
      authLogin = LoginModel.fromJson(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error));
    });
  }

  late AuthUserRegister authUserRegister;

  void userRegister({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required String address,
    required String phone,
    //required FileImage image,
  }) {
    emit(UserRegisterLoadingState());

    DioHelper.postData(url: '', data: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      //'image': image,
    }).then((value) {
      authUserRegister = AuthUserRegister.fromJson(value.data);
      emit(UserRegisterSuccessState());
    }).catchError((error) {
      emit(UserRegisterErrorState(error));
    });
  }

  late AuthConsultantRegister authConsultantRegister;

  void consultantRegister({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required String address,
    required String phone,
    //required FileImage image,
    required String bio,
    required int skill,
    required String shiftStart,
    required String shiftEnd,
  }) {
    emit(ConsultantRegisterLoadingState());

    DioHelper.postData(url: '', data: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      //'image' : image,
      'bio': bio,
      'skill': skill,
      'shiftStart': shiftStart,
      'shiftEnd': shiftEnd,
    }).then((value) {
      authConsultantRegister = AuthConsultantRegister.fromJson(value.data);
      emit(ConsultantRegisterSuccessState());
    }).catchError((error) {
      emit(ConsultantRegisterErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  List<String> consultations = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  String selectedConsultation = '';

  void changeSelectedConsultation(value) {
    selectedConsultation = value;
    emit(ChangeSelectedConsultationState());
  }
}
