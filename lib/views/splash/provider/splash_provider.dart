import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/secure_storage.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> startApp(BuildContext context) async {
    final token = await SecureStorage().getToken('token');
    if (token == null) {
      Timer(const Duration(seconds: 1),
          () => Navigator.pushReplacementNamed(context, 'login'));
    } else {
      Timer(const Duration(seconds: 1),
          () => Navigator.pushReplacementNamed(context, 'home'));
    }
    notifyListeners();
  }
}
