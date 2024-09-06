import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/secure_storage.dart';
import 'package:whatsapp/main.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio();

  /// Add headers including token when token is not null.
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

// Print status code after every api call.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(response.statusCode.toString());
    super.onResponse(response, handler);
  }

// Print type of error in case of errors.
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
