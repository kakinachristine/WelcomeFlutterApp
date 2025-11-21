import 'package:flutter/material.dart';
import 'package:welcomeapp/Screens/Login Screen/loginUI.dart';
import 'package:welcomeapp/Screens/Login Screen/loginController.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return LoginUI(controller: controller);
  }
}
