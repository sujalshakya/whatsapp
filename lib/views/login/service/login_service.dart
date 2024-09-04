import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/service/interceptor.dart';
import 'package:whatsapp/base/service/secure_storage.dart';

class AuthService {
  static Future<bool> loginApiRequest(String email, String password) async {
    final dio = Dio(BaseOptions());
    dio.interceptors.add(DioInterceptor());

    final response = await dio.post(
      (ApiUrls.login),
      data: jsonEncode(<String, String>{
        'username': email,
        'password': password,
      }),
    );
    try {
      var data = jsonDecode(response.toString());
      await SecureStorage().setToken('token', data['token']);

      return true;
    } catch (e) {
      return false;
    }
  }
}
