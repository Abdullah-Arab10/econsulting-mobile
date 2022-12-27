// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/details/consultant_details_model.dart';
import 'package:e_consulting_flutter/data/models/details/details_model.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_model.dart';
import 'package:e_consulting_flutter/data/models/search/search_model.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/favorite_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/home_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/profile_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/profile_screen.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

S t = S();

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }

  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  bool isFavorite = false;
  IconData favorite = Icons.favorite_border;

  void changeFavoriteIcon()
  {
    isFavorite = !isFavorite;
    favorite =
    isFavorite ? Icons.favorite : Icons.favorite_border;
    emit(ChangeFavoriteIconState());
  }

  late HomeModel homeModel;

  void getHomeData(){
    emit(HomeGetConsultantsLoadingState());

    DioHelper.getData(url: GET_CONSULTANTS_LIST,).then((value) {

      homeModel = HomeModel.fromJson(value.data);

      emit(HomeGetConsultantsSuccessState());
    },).catchError((error){
      print(error.toString());
      emit(HomeGetConsultantsErrorState(error.toString()));
    });
  }

  late DetailsModel detailsModel;

  void getConsultantDetails({
  required int id,
}){

    emit(HomeGetConsultantsDetailsLoadingState());

    DioHelper.getData(url: '$DETAILS$id' ,).then((value) {

      detailsModel = DetailsModel.fromJson(value.data, value.statusCode);



      emit(HomeGetConsultantsDetailsSuccessState());
    },).catchError((error){
      print(error.toString());
      emit(HomeGetConsultantsDetailsErrorState(error.toString()));
    });
  }

  late SearchModel searchModel;

  void postSearch({
  required String value,
})
  {
    emit(SearchGetConsultantLoading());

    DioHelper.postData(
        url: SEARCH,
        data: {
          'username' : value
        }
    ).then((value) {
      print(value.data);
      searchModel = SearchModel.fromJson(value.data);
      //print(SearchModel.fromJson(value.data));
      emit(SearchGetConsultantSuccess());
    },).catchError((error){
      print(error.toString());
      emit(SearchGetConsultantError());
    });
  }

}