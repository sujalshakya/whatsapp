import 'package:flutter/material.dart';
import 'package:whatsapp/base/route.dart';
import 'package:whatsapp/views/register/service/register_service.dart';

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
      final bool register = await AuthService.registerApiRequest(
          emailController.text,
          passwordController.text,
          fullNameController.text);

      if (register) {
        navigatorKey.currentState!.pushNamed('login');
      } else {
        debugPrint("registration failed");
      }
      notifyListeners();
    }
  }
}
