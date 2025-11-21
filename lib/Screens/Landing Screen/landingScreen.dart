import 'package:flutter/material.dart';
import 'package:welcomeapp/Screens/Landing Screen/landingUI.dart';
import 'package:welcomeapp/Screens/Landing Screen/landingController.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LandingController();

    return LandingUI(controller: controller);
  }
}
