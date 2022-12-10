// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_model.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/favorite_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/home_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/settings_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/settings.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }

  List<String> titles = ['Home Page', 'Favorite Page', 'Settings'];

  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    Settings()
  ];

  List<BottomNavigationBarItem> bottomItem =
  [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_filled,
        ),
        label: 'Home'

    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
        ),
        label: 'Favorite'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Settings'
    ),
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
      // print(value.data);
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel);
      emit(HomeGetConsultantsSuccessState());
    },).catchError((error){
      print(error.toString());
      emit(HomeGetConsultantsErrorState(error.toString()));
    });
  }
}