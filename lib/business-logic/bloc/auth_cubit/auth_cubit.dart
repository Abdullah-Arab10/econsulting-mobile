// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_states.dart';
import 'package:e_consulting_flutter/data/models/auth/auth_login.dart';
import 'package:e_consulting_flutter/data/models/consultant/auth_consultant_register.dart';
import 'package:e_consulting_flutter/data/models/user/auth_user_register.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  late LoginModel authLogin;

  void userLogin({
    required String email,
    required String password,
  }) {
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      authLogin = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(authLogin));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
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
    File? image,
  }) {
    emit(UserRegisterLoadingState());

    DioHelper.postData(url: REGISTER_AS_USER, data: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'image': image,
    }).then((value) {
      authUserRegister = AuthUserRegister.fromJson(value.data);
      emit(UserRegisterSuccessState());
    }).catchError((error) {
      emit(UserRegisterErrorState(error));
    });
  }

  late AuthConsultantRegister authConsultantRegister;

  void consultantRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String address,
    required String phone,
    File? image,
    required String bio,
    required int skill,
    required String shiftStart,
    required String shiftEnd,
  }) {
    emit(ConsultantRegisterLoadingState());

    // FormData form = FormData.fromMap({
    //   'firstName': firstName,
    //   'lastName': lastName,
    //   'email': email,
    //   'password': password,
    //   'address': address,
    //   'phone': phone,
    //   'image' : image,//await MultipartFile.fromFile(image.path,) ,
    //   'bio': bio,
    //   'skill': skill,
    //   'shiftStart': shiftStart,
    //   'shiftEnd': shiftEnd,
    // });
    // print(form);
    // DioHelper.postForm(
    //     url: REGISTER_AS_CONSULTANT,
    //     data: form
    // ).then((value) {
    //   authConsultantRegister = AuthConsultantRegister.fromJson(value.data);
    //   emit(ConsultantRegisterSuccessState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(ConsultantRegisterErrorState(error.toString()));
    // });
    DioHelper.postData(
        url: REGISTER_AS_CONSULTANT,
        data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'image': image,
      'bio': bio,
      'skill': skill,
      'shiftStart': shiftStart,
      'shiftEnd': shiftEnd,
    }).then((value) {
      authConsultantRegister = AuthConsultantRegister.fromJson(value.data);
      emit(ConsultantRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ConsultantRegisterErrorState(error.toString()));
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

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ConsultantProfileImageSuccessState());
    } else {
      print('No image selected');
      emit(ConsultantProfileImageErrorState());
    }
  }

  String upload() {
    var uri = Uri.file(profileImage!.path).pathSegments.last;

    print(uri);
    return uri;
  }
}
