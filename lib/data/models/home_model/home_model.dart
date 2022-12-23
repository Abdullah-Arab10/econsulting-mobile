import 'package:e_consulting_flutter/data/models/home_model/home_data_model.dart';

class HomeModel {
  static HomeDataModel? data;

  HomeModel();

  HomeModel.fromJson(Map<String, dynamic> json) {
    data = HomeDataModel.fromJson(json["data"]);
  }
}
