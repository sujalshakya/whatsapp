import 'package:flutter/material.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labellarge_black.dart';

/// Line at the bottom of register view which navigates to login page when tapped.

class AuthFooter extends StatelessWidget {
  /// Requires [tap] which is the text to be shown which is tappable to perform [onTap].
  /// Requires [message] which is the text to be shown before [tap].
  /// Requires [onTap] which is the task called when [tap] is tapped.
  const AuthFooter({
    super.key,
    required this.tap,
    required this.message,
    this.onTap,
    required Future<Object?> ontap,
  });

  final String tap;
  final String message;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        GestureDetector(
          onTap: () {
            onTap;
          },
          child: TextLabellargeBlack(
            text: tap,
          ),
        )
      ],
    );
  }
}
