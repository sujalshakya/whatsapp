import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/base/constants/api_urls.dart';

class AuthService {
  static Future<bool> registerApiRequest(
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
