import 'package:flutter/material.dart';
import 'package:whatsapp/base/route.dart';
import 'package:whatsapp/views/login/service/login_service.dart';

class LoginProvider extends ChangeNotifier {
  void loginApiRequest(String email, String password) async {
    final bool login = await AuthService.loginApiRequest(email, password);

    if (login) {
      navigatorKey.currentState!.pushNamed('home');
      notifyListeners();
    } else {
      debugPrint("login failed");
      notifyListeners();
    }

    notifyListeners();
  }
}
