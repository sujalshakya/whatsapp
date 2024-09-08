import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/route_service.dart';
import 'package:whatsapp/base/service/snackbar_service.dart';
import 'package:whatsapp/views/register/repository/register_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final registerKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
  }

  void registerApiRequest() async {
    if (registerKey.currentState!.validate()) {
      final bool register = await RegisterRepository.register(
          emailController.text,
          passwordController.text,
          fullNameController.text);

      /// Manually clear controllers before navigating.
      if (register) {
        emailController.clear();
        passwordController.clear();
        fullNameController.clear();
        navigatorKey.currentState!.pushNamed('login');
        SnackBarService.showSnackBar(
          content: "Registration Successful",
        );
      } else {
        debugPrint("registration failed");
      }
      notifyListeners();
    }
  }
}
