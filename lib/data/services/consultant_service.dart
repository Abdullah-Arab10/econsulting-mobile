import 'package:dio/dio.dart';
import 'package:e_consulting_flutter/data/services/base_service.dart';

class ConsultantsService extends BaseService {
  late Dio dio;
  ConsultantsService() {
    dio = Dio(this.options);
  }
  Future<List<dynamic>> getAllConsultants() async {
    Response response = await dio.get('consultants-list');
    return response.data;
  }
}
