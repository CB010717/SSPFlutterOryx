import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;

  const InputFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
