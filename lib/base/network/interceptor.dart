import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/secure_storage.dart';
import 'package:whatsapp/base/service/snackbar_service.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio();

  /// Add headers to requests, include token when token is not null in secure storage.
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

  // Print status code after every api response.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(response.statusCode.toString());
    super.onResponse(response, handler);
  }

  /// Give feedback of type of error to user using snackbar.
  @override
  Future<void> onError(err, handler) async {
    debugPrint(err.toString());
    if (err.response?.statusCode == 400) {
      SnackBarService.showSnackBar(content: "Client Error");
    }

    if (err.response?.statusCode == 500) {
      SnackBarService.showSnackBar(content: "Internal Server Error");
    }
  }
}
