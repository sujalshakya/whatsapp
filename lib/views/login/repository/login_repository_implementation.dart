import 'dart:convert';

import 'package:whatsapp/base/service/secure_storage.dart';
import 'package:whatsapp/views/login/repository/login_repository.dart';
import 'package:whatsapp/views/login/service/login_service.dart';

interface class LoginRepositoryImplementation implements LoginRepository {
  @override
  Future<bool> login(String email, String password) async {
    try {
      String data = jsonEncode(<String, String>{
        'username': email,
        'password': password,
      });
      final response = await AuthService.loginApiRequest(data);

      var login = jsonDecode(response.toString());

      /// Store token in secure storage.
      await SecureStorage().setToken('token', login['token']);
      return true;
    } catch (e) {
      return false;
    }
  }
}
