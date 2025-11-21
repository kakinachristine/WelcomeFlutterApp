import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:welcomeapp/Services/apiService.dart';
import 'package:welcomeapp/Utils/endpoints.dart';


class LoginController {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();


  //Init function
  Future<void> init(
      TextEditingController emailController,
      TextEditingController passwordController,
      ValueNotifier<bool> keepSignedInNotifier,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('savedEmail') ?? '';
    final savedPassword = prefs.getString('savedPassword') ?? '';
    final keepSignedIn = prefs.getBool('keepSignedIn') ?? false;

    // Prefill controllers
    emailController.text = savedEmail;
    passwordController.text = savedPassword;
    keepSignedInNotifier.value = keepSignedIn;
  }

  // Login function
  Future<void> login(BuildContext context, String email, String password,bool keepSignedIn) async {
    debugPrint("User login with email: $email");

    // Save keep me signed in preference + email/password
    if (keepSignedIn) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('keepSignedIn', true);
      await prefs.setString('savedEmail', email);
      await prefs.setString('savedPassword', password);
    } else {
      // Clear saved credentials if unchecked
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('keepSignedIn', false);
      await prefs.remove('savedEmail');
      await prefs.remove('savedPassword');
    }

    //login body
    final body = {
      "email": email,
      "password": password,
    };

    // Call APIService
    final result = await ApiService.request(
      method: "POST",
      url: AppEndpoints.userLogin,
      body: body,
    );

    if (result.containsKey("error") && result["error"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${result["message"]}")),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful")),
      );

      debugPrint("Login Successful");

      //Navigate to home screen

    }
  }


  //Sign in with google
  // Future<void> signInWithGoogle(BuildContext context) async {
  //   try {
  //     final account = await _googleSignIn.signIn();
  //     if (account != null) {
  //       debugPrint("Google Sign-In successful: ${account.email}");
  //
  //       // Navigate to home
  //       Navigator.pushReplacementNamed(context, "/home");
  //     }
  //   } catch (error) {
  //     debugPrint("Google Sign-In error: $error");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Google Sign-In failed")),
  //     );
  //   }
  // }


}
