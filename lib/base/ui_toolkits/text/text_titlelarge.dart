import 'package:flutter/material.dart';

/// Fontsize is 22.

class TextTitleLarge extends StatelessWidget {
  final String text;
  const TextTitleLarge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Theme.of(context).colorScheme.surface));
  }
}
