import 'package:flutter/material.dart';

import 'package:welcomeapp/Shared Widgets/customButton.dart';
import 'package:welcomeapp/Screens/Landing Screen/landingController.dart';
import 'package:welcomeapp/Screens/Landing Screen/landingStyle.dart';
import 'package:welcomeapp/Screens/Landing Screen/Components/landingCarousel.dart';
import 'package:welcomeapp/Utils/colors.dart';
import 'package:welcomeapp/Utils/constants.dart';

class LandingUI extends StatelessWidget {
  final LandingController controller;

  const LandingUI({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LandingStyles.backgroundColor,
      body: Center(
        child: Padding(
          padding: LandingStyles.pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Carousel
              const LandingCarousel(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),


              //Buttons
              CustomButton(
                title: "Login",
                isTapped: false,
                onTap: () => controller.goToNextScreen(context),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              TextButton(
                onPressed: () {
                  //Navigate to sign up
                },
                child: const Text(
                  AppStrings.registerText,
                  style: LandingStyles.registerButtonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
