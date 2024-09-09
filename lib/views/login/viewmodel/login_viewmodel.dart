import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/route_service.dart';
import 'package:whatsapp/base/viewmodel/base_viewmodel.dart';
import 'package:whatsapp/views/login/models/login_request_model.dart';
import 'package:whatsapp/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends BaseViewmodel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final loginRepo = LoginRepositoryImplementation();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginApiRequest() async {
    final loginRequestModel = LoginRequestModel(
        username: emailController.text, password: passwordController.text);
    if (loginKey.currentState!.validate()) {
      final bool login = await loginRepo.login(loginRequestModel);

      /// Manually clear controllers before navigating.
      if (login == true) {
        emailController.clear();
        passwordController.clear();

        navigatorKey.currentState!.restorablePushReplacementNamed('home');
        showSnackBar(
          content: "Login Successful",
        );
      } else {
        debugPrint("login failed");
      }

      notifyListeners();
    }
  }
}
