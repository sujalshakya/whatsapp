import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/views/register/service/register_service.dart';

class RegisterProvider extends ChangeNotifier {
  void registerApiRequest(BuildContext context, String email, String password,
      String fullName) async {
    final bool success =
        await AuthService.registerApiRequest(email, password, fullName);

    if (success) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, 'home');
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(Strings.registerFail),
        ));
      }
    }
    notifyListeners();
  }
}
