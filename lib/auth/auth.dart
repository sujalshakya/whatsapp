import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/constants/api_urls.dart';

class AuthService {
  static Future<bool> login(String email, String password) async {
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
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      debugPrint(responseData.toString());
      return true;
    }
    return false;
  }

  static Future<bool> register(
      String email, String fullName, String password) async {
    final response = await http.post(
      Uri.parse(ApiUrls.signup),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'full_name': fullName
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      debugPrint(responseData.toString());
      return true;
    } else {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      debugPrint(responseData.toString());
    }
    return false;
  }
}
