import 'package:flutter/material.dart';

class LabelLarge extends StatelessWidget {
  /// Fontsize is 14.
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
