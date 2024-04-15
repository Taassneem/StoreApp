// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.labelText,
      this.onChange,
      this.obscureText = false,
      this.textInputType});
  final String labelText;
  final Function(String)? onChange;
  bool? obscureText;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      keyboardType: textInputType,
      onChanged: onChange,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: labelText,
      ),
    );
  }
}
