import 'dart:convert';

import 'package:whatsapp/base/service/secure_storage.dart';
import 'package:whatsapp/views/login/service/login_service.dart';

abstract class LoginRepository {
  static Future<bool> login(String email, String password) async {
    var data = jsonEncode(<String, String>{
      'username': email,
      'password': password,
    });
    final response = await AuthService.loginApiRequest(data);
    try {
      var data = jsonDecode(response.toString());
      // Store token in secure storage.
      await SecureStorage().setToken('token', data['token']);

      return true;
    } catch (e) {
      return false;
    }
  }
}
