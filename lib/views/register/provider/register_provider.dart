import 'package:flutter/material.dart';
import 'package:whatsapp/base/route.dart';
import 'package:whatsapp/views/register/service/register_service.dart';

class RegisterProvider extends ChangeNotifier {
  void registerApiRequest(
      String email, String password, String fullName) async {
    final bool register =
        await AuthService.registerApiRequest(email, password, fullName);

    if (register) {
      navigatorKey.currentState!.pushNamed('login');
    } else {
      debugPrint("registration failed");
    }
    notifyListeners();
  }
}
