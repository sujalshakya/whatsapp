import 'package:flutter/material.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

/// Show snackbar from anywhere without context.
mixin class SnackBarService {
  static void showSnackBar({required String content}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content),
    ));
  }
}
