import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingController {
  void goToNextScreen(BuildContext context) async{
    //Update to not user's first time
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);

    Navigator.pushNamed(context, "/login");
  }

}
