// ignore_for_file: non_constant_identifier_names
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_states.dart';
import 'package:e_consulting_flutter/data/models/auth/auth_login.dart';
import 'package:e_consulting_flutter/data/models/consultant/auth_consultant_register.dart';
import 'package:e_consulting_flutter/data/models/user/auth_user_register.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
  late FormData imageData;
  var picker = ImagePicker();
  PickedFile? pickedFile;
  Future<void> getProfileImage() async {
    pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile!.path);
      emit(ConsultantProfileImageSuccessState());
    } else {
      print('No image selected');
      emit(ConsultantProfileImageErrorState());
    }
  }

  String upload() {
    var uri = Uri.file(profileImage!.path).pathSegments.last;
    return uri;
  }

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
  }) async {
    emit(ConsultantRegisterLoadingState());
    FormData form = FormData.fromMap({
      "image": await MultipartFile.fromFile(pickedFile!.path,
          filename: upload(), contentType: MediaType("image", "jpg")),
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'bio': bio,
      'skill': skill,
      'shiftStart': shiftStart,
      'shiftEnd': shiftEnd,
    });
    DioHelper.postForm(url: REGISTER_AS_CONSULTANT, data: form).then((value) {
      authConsultantRegister = AuthConsultantRegister.fromJson(value.data);
      emit(ConsultantRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ConsultantRegisterErrorState(error.toString()));
    });
  }
}
