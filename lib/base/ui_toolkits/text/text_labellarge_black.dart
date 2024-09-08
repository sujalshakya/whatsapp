import 'package:flutter/material.dart';

/// Fontsize is 14.
class TextLabellargeBlack extends StatelessWidget {
  final String text;

  const TextLabellargeBlack({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
