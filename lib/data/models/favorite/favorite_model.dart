import 'package:e_consulting_flutter/data/models/favorite/favorite_data_model.dart';

class FavoriteModel {
  static FavoriteDataModel? data;

  FavoriteModel();

  FavoriteModel.fromJson(dynamic json) {
    data = (json['data'] != null ? FavoriteDataModel.fromJson(json['data']) : null)!;
  }
}
