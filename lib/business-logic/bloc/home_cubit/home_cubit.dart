// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_print



import 'package:e_consulting_flutter/business-logic/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/data/models/details/details_model.dart';
import 'package:e_consulting_flutter/data/models/favorite/favorite_data_model.dart';
import 'package:e_consulting_flutter/data/models/favorite/favorite_model.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';
import 'package:e_consulting_flutter/data/models/home_model/home_model.dart';
import 'package:e_consulting_flutter/data/models/search/search_model.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/favorite_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/home_screen.dart';
import 'package:e_consulting_flutter/presentation/pages/home_layout/profile_screen.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

S t = S();

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(context,int index) {
    currentIndex = index;

    emit(HomeBottomNavState());
    if(index == 1)
    {
      FavoriteDataModel.favoriteList = [];
      emit(GetFavoriteListLoadingState());
      getFavoriteList(context);
    }
  }

  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  late HomeModel homeModel;

  Map<int, bool> favorites = {};

  void getHomeData(context) {
    int id = BlocProvider.of<AuthCubit>(context).authLogin.user.id;
    HomeDataModel.doctors = [];
    HomeDataModel.dentists = [];
    HomeDataModel.therapists = [];
    HomeDataModel.lawyers = [];
    HomeDataModel.economists = [];
    HomeDataModel.software_engineers = [];
    HomeDataModel.civil_engineers = [];
    emit(HomeGetConsultantsLoadingState());

    DioHelper.getData(url: '$GET_CONSULTANTS_LIST$id',).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      HomeDataModel.doctors.forEach((element) {
        favorites.addAll({
          element['user_id'] : element['isFavorite'],
        });
      });

      HomeDataModel.dentists.forEach((element) {
        favorites.addAll({
          element['user_id'] : element['isFavorite'],
        });
      });

      HomeDataModel.therapists.forEach((element) {
        favorites.addAll({
          element['user_id'] : element['isFavorite'],
        });
      });

      HomeDataModel.lawyers.forEach((element) {
        favorites.addAll({
          element['user_id'] : element['isFavorite'],
        });
      });

      HomeDataModel.economists.forEach((element) {
        favorites.addAll({
          element['user_id'] : element['isFavorite'],
        });
      });

      HomeDataModel.software_engineers.forEach((element) {
        favorites.addAll({
          element['user_id'] : element['isFavorite'],
        });
      });

      HomeDataModel.civil_engineers.forEach((element) {
        favorites.addAll({
          element['user_id'] : element['isFavorite'],
        });
      });

      print(favorites);

      emit(HomeGetConsultantsSuccessState());
    },).catchError((error) {
      print(error.toString());
      emit(HomeGetConsultantsErrorState(error.toString()));
    });
  }

  late DetailsModel detailsModel;

  void getConsultantDetails({
    required int id,
  }) {
    emit(HomeGetConsultantsDetailsLoadingState());

    DioHelper.getData(url: '$DETAILS$id',).then((value) {

      detailsModel = DetailsModel.fromJson(value.data, value.statusCode);

      emit(HomeGetConsultantsDetailsSuccessState());

    },).catchError((error) {
      print(error.toString());
      emit(HomeGetConsultantsDetailsErrorState(error.toString()));
    });
  }

  late SearchModel searchModel;

  void postSearch({
    required String value,
  }) {
    emit(SearchGetConsultantLoading());

    DioHelper.postData(
        url: SEARCH,
        data: {
          'username': value
        }
    ).then((value) {
      print(value.data);
      searchModel = SearchModel.fromJson(value.data);
      //print(SearchModel.fromJson(value.data));
      emit(SearchGetConsultantSuccess());
    },).catchError((error) {
      print(error.toString());
      emit(SearchGetConsultantError(error.toString()));
    });
  }

  void postConsultantRating({
    required double rating,
    required int consultantId,
    required int clientId,
  }) {
    emit(ConsultantRatingLoading());

    DioHelper.postData(
        url: RATE,
        data:
        {
          'rate' : rating,
          'consultantId' : consultantId,
          'clientId' : clientId
        }
    ).then((value) {
      emit(ConsultantRatingSuccess());
    },).catchError((error){
      print(error.toString());
      emit(ConsultantRatingError(error.toString()));
    });
  }

  void postFavorite({
  required bool add,
  required int consultantId,
  required int clientId,
    context
  })
{

  favorites[consultantId] = !favorites[consultantId]!;

  emit(FavoriteLoadingState());

  DioHelper.postData(
      url: FAVORITE,
      data:
      {
        'add' : add,
        'consultantid' : consultantId,
        'clientid' : clientId,
      }
  ).then((value) {

    emit(FavoriteSuccessState());
    FavoriteDataModel.favoriteList = [];
    getFavoriteList(context);
  },).catchError((error)
  {
    print(error.toString());
    emit(FavoriteErrorState(error.toString()));
  });
}

void getFavoriteList(context)
{
  int id = BlocProvider.of<AuthCubit>(context).authLogin.user.id;

  emit(GetFavoriteListLoadingState());

  DioHelper.getData(
      url: '$GET_FAVORITE$id'
  ).then((value) {
    FavoriteModel.fromJson(value.data);
    print(FavoriteDataModel.favoriteList);
    emit(GetFavoriteListSuccessState());
  },).catchError((error){
    print(error.toString());
    emit(GetFavoriteListErrorState(error.toString()));
  });
}
}