import 'package:flutter/material.dart';

/// Show snackbar from anywhere without context.

class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar({required String content}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content),
    ));
  }

  void dispose() {
    scaffoldKey.currentState!.dispose();
  }
}
