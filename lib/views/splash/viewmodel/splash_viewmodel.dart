import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/secure_storage.dart';

class SplashViewModel extends ChangeNotifier {
  String navigate = '';

  /// Navigates after a delay of 1 second
  /// to login or home depending on token.

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
