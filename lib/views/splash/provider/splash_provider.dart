import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/secure_storage.dart';

class SplashProvider extends ChangeNotifier {
  String navigate = '';
  Future<void> startApp() async {
    final token = await SecureStorage().getToken('token');
    if (token == null) {
      navigate = "login";
    } else {
      navigate = "home";
    }
    notifyListeners();
  }
}
