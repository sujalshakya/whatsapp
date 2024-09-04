import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/views/login/service/login_service.dart';

class LoginProvider extends ChangeNotifier {
  void loginApiRequest(
      BuildContext context, String email, String password) async {
    final bool success = await AuthService.loginApiRequest(email, password);

    if (success) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, 'home');
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(Strings.loginFail),
        ));
      }
    }
    notifyListeners();
  }
}
