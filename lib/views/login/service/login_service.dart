import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/secure_storage.dart';

class AuthService {
  static Future<bool> loginApiRequest(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiUrls.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      await SecureStorage().setToken('token', data['token']);

      return true;
    }
    return false;
  }
}
