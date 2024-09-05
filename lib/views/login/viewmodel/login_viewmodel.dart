import 'package:flutter/material.dart';
import 'package:whatsapp/base/route.dart';
import 'package:whatsapp/views/login/service/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginApiRequest() async {
    if (loginKey.currentState!.validate()) {
      final bool login = await AuthService.loginApiRequest(
          emailController.text, passwordController.text);

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
}
