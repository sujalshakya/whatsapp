import 'package:flutter/material.dart';

class TextLabellargeBlack extends StatelessWidget {
  final String text;

  /// Fontsize is 14.
  const TextLabellargeBlack({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
