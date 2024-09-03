import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/secure_storage.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio();
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json",
    });
    final token = await SecureStorage().getToken('token');
    if (token != null) {
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(err, handler) async {
    debugPrint(err.toString());
    if (err.response?.statusCode == 400) {
      debugPrint("Client Error");
    }

    if (err.response?.statusCode == 500) {
      debugPrint("Internal Server Error");
    }
  }
}
