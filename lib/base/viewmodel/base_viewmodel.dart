import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/snackbar_service.dart';

class BaseViewmodel extends ChangeNotifier with SnackBarService {
  void showSnackBar({required String content}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    scaffoldKey.currentState!.dispose();
  }
}
