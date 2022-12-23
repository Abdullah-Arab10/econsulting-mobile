import 'package:dio/dio.dart';
import 'package:e_consulting_flutter/shared/constants/global_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static var dio = Dio();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {},
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
      // requestHeader: true,
      // requestBody: true,
      // responseBody: true,
      // responseHeader: false,
      // compact: false,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'ar',
    // String? token,
  }) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response<dynamic>> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    return await dio.post<dynamic>(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response<dynamic>> postForm({
    required String url,
    Map<String, dynamic>? query,
    required FormData data,
    String lang = 'ar',
    String? token,
  }) async {
    return await dio.post<dynamic>(url,
        queryParameters: query,
        data: data,
        options: Options(contentType: "multipart/form-data"));
  }
}
