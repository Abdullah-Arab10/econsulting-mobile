import 'package:dio/dio.dart';

import '../../shared/constants/global_constants.dart';

class BaseService {
  BaseOptions options = BaseOptions(
    baseUrl: BASE_URL,
    receiveDataWhenStatusError: true,
    connectTimeout: 15 * 1000,
    receiveTimeout: 15 * 1000,
  );
}
