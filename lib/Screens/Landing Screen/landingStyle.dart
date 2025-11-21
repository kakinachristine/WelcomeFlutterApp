import 'package:flutter/material.dart';
import 'package:welcomeapp/Utils/colors.dart';

class LandingStyles {
  static const backgroundColor = AppColors.background;
  static const pagePadding = EdgeInsets.symmetric(horizontal: 24.0);

  //create acc text button
  static const TextStyle registerButtonText = TextStyle(
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  //Carousel title
  static const TextStyle carouselTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  //Carousel paragraph
  static const TextStyle carouselParagraph= TextStyle(
    fontSize: 15,
    color: AppColors.greyedText,
  );

}
