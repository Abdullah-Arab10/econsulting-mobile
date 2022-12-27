import 'package:e_consulting_flutter/data/models/search/search_data_model.dart';

class SearchModel {
  static SearchDataModel? data;

  SearchModel();

  SearchModel.fromJson(dynamic json) {
    data = (json != null ? SearchDataModel.fromJson(json) : null)!;
  }
}
