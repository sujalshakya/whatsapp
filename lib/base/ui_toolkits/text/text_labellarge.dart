import 'package:flutter/material.dart';

/// Fontsize is 14.

class LabelLarge extends StatelessWidget {
  const LabelLarge({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
