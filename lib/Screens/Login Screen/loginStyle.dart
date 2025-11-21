import 'package:flutter/material.dart';
import 'package:welcomeapp/Utils/colors.dart';

class LoginStyles {
  static const backgroundColor = AppColors.background;
  static const pagePadding = EdgeInsets.symmetric(horizontal: 24.0);
  static Color dividerColor = AppColors.greyedText.withOpacity(0.6);

  // Title
  static TextStyle titleStyle(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width * 0.09,
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    );
  }

  // paragraph text
  static TextStyle paragraphStyle(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width * 0.045,
      fontWeight: FontWeight.normal,
      color: AppColors.greyedText,
    );
  }

  //Text field label
  static TextStyle labelStyle(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width * 0.045,
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    );
  }

  //Forgot password
  static TextStyle clickableLabelStyle(BuildContext context) {
    return labelStyle(context).copyWith(
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
    );
  }

  // Checkbox label style
  static TextStyle checkboxLabelStyle(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width * 0.04,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
    );
  }


  static TextStyle orSignInStyle(BuildContext context) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.035,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      color: AppColors.greyedText.withOpacity(0.6),
    );
  }

  static final ButtonStyle googleButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: AppColors.greyedText.withOpacity(0.1),
    side: BorderSide.none,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: 16,
    ),
  );

  static TextStyle googleButtonTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.04,
      fontWeight: FontWeight.bold,
      color: AppColors.greyedText,
    );
  }

  //create acc text button
  static const TextStyle registerButtonText = TextStyle(
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );



}
