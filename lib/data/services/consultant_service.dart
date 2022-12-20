import 'package:dio/dio.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';
import 'package:e_consulting_flutter/data/services/base_service.dart';

class ConsultantsService extends BaseService {
  late Dio dio;
  ConsultantsService() {
    dio = Dio(this.options);
  }
  Future<List<dynamic>> getAllConsultants() async {
    Response response = await dio.get('consultant/consultants-list');
    print(response.data);
    return response.data;
  }
  login(email,password) async{
  var response=await  dio.post('auth/login',data: {
      "email": email,
      "password": password,
    }).then((value) => print(value.statusCode));
  return(response);
  }
}
