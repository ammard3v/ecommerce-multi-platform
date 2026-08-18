import 'package:dio/dio.dart';
import 'interceptors/auth_interceptor.dart';
import '../../utils/constants/api_constants.dart';
import 'package:flutter/foundation.dart';
class DioClient {
  final Dio dio;
  DioClient({
    required AuthInterceptor authInterceptor,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: Constants.base_url,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            responseType: ResponseType.json,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ) {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }
    dio.interceptors.add(authInterceptor);
  }
}