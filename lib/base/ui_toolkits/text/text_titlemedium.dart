import 'package:flutter/material.dart';

class TextTitleMedium extends StatelessWidget {
  final String text;
  const TextTitleMedium({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(context).colorScheme.surface));
  }
}
