import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:welcomeapp/Shared Widgets/customButton.dart';
import 'package:welcomeapp/Screens/Landing Screen/landingScreen.dart';
import 'package:welcomeapp/Screens/Login Screen/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // Check if it's the user's first time
  final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),

      },
      home: isFirstTime
          ? const LandingScreen()
          : const LoginScreen(),
    );
  }

}

