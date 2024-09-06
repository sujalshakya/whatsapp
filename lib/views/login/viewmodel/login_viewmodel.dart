import 'package:flutter/material.dart';
import 'package:whatsapp/base/route.dart';
import 'package:whatsapp/base/service/snackbar_service.dart';
import 'package:whatsapp/views/login/repository/login_repository.dart';

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
      final bool login = await LoginRepository.login(
          emailController.text, passwordController.text);

      if (login == true) {
        emailController.clear();
        passwordController.clear();

        navigatorKey.currentState!.restorablePushReplacementNamed('home');
        SnackBarService.showSnackBar(
          content: "Login Successful",
        );
        notifyListeners();
      } else {
        debugPrint("login failed");

        notifyListeners();
      }

      notifyListeners();
    }
  }
}
