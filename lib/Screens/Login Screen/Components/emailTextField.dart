import 'package:flutter/material.dart';

import 'package:welcomeapp/Screens/Login Screen/loginStyle.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const EmailTextField({
    super.key,
    required this.controller,
    this.hintText = "Email",
  });

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email cannot be empty";
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      validator: _validateEmail,
    );
  }
}
