import 'package:dio/dio.dart';
import 'package:whatsapp/base/service/interceptor.dart';

class DioInstance {
  Dio dio = Dio(BaseOptions(connectTimeout: const Duration(milliseconds: 3600)))
    ..interceptors.addAll([LogInterceptor(), DioInterceptor()]);
}
