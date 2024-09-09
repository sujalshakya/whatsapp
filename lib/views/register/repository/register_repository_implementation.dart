import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp/views/register/models/register_request_model.dart';
import 'package:whatsapp/views/register/repository/register_repository.dart';
import 'package:whatsapp/views/register/service/register_service.dart';

interface class RegisterRepositoryImplementation implements RegisterRepository {
  @override
  Future<bool> register(RegisterRequest registerRequest) async {
    try {
      final response = await AuthService.registerApiRequest(registerRequest);

      final responseData = jsonDecode(response.toString());
      debugPrint(responseData.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
