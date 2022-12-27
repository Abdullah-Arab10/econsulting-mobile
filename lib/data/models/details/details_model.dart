import 'package:e_consulting_flutter/data/models/details/consultant_details_model.dart';

class DetailsModel {
  late int? status;
  late ConsultantData data;

  DetailsModel();

  DetailsModel.fromJson(Map<String, dynamic> json, int? statusCode) {

    status = statusCode;
    data = (json['data'] != null ? ConsultantData.fromJson(json['data']) : null)!;
      print(data);
  }
}
