import 'package:flutter/material.dart';

/// Fontsize is 11.

class TextLabelSmall extends StatelessWidget {
  final String text;
  const TextLabelSmall({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "3",
      style: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
