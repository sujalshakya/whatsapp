import 'dart:convert';

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
      await AuthService.loginApiRequest(data);

      return true;
    } catch (e) {
      return false;
    }
  }
}
