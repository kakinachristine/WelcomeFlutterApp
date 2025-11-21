import 'package:flutter/material.dart';


import 'package:welcomeapp/Utils/colors.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isTapped;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isTapped = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isTapped ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: isTapped
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2),
        )
            : Text(
          title,
          style: const TextStyle(color: AppColors.textLight),
        ),
      ),
    );
  }
}
