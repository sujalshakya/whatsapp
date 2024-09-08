import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp/views/register/repository/register_repository.dart';
import 'package:whatsapp/views/register/service/register_service.dart';

interface class RegisterRepositoryImplementation implements RegisterRepository {
  @override
  Future<bool> register(String email, String fullName, String password) async {
    String data = jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'full_name': fullName
    });

    try {
      final response = await AuthService.registerApiRequest(data);

      final responseData = jsonDecode(response.toString());
      debugPrint(responseData.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
