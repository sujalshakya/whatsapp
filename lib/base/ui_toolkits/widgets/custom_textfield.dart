import 'package:flutter/material.dart';

/// A custom textfield requiring [controller] and [validator].

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(12)),
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          )),
    );
  }
}
