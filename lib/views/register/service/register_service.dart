import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/service/interceptor.dart';

class AuthService {
  static Future<bool> registerApiRequest(
      String email, String fullName, String password) async {
    final dio = Dio(BaseOptions());
    dio
      ..interceptors.add(DioInterceptor())
      ..interceptors.add(LogInterceptor());
    final registerRequestData = jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'full_name': fullName
    });
    try {
      final response = await dio.post(
        (ApiUrls.signup),
        data: registerRequestData,
      );
      final Map<String, String> responseData = jsonDecode(response.toString());
      debugPrint(responseData.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
