import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import 'package:welcomeapp/Shared Widgets/customButton.dart';
import 'package:welcomeapp/Screens/Login Screen/loginController.dart';
import 'package:welcomeapp/Screens/Login Screen/loginStyle.dart';
import 'package:welcomeapp/Screens/Login Screen/Components/emailTextField.dart';
import 'package:welcomeapp/Screens/Login Screen/Components/passwordTextField.dart';
import 'package:welcomeapp/Utils/constants.dart';
import 'package:welcomeapp/Utils/colors.dart';

class LoginUI extends StatefulWidget {
  final LoginController controller;

  const LoginUI({super.key, required this.controller});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _keepSignedIn = ValueNotifier(false);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.controller.init(
      _emailController,
      _passwordController,
      _keepSignedIn,
    );
  }


  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive spacing
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: LoginStyles.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.07,
            vertical: height * 0.19,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Login Title
                Text(
                  AppStrings.loginTitle,
                  style: LoginStyles.titleStyle(context),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: height * 0.015),

                // Login Body Text
                Text(
                  AppStrings.loginText,
                  style: LoginStyles.paragraphStyle(context),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: height * 0.04),

                // Email TextField
                Text(
                  "Email Address",
                  style: LoginStyles.labelStyle(context),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                EmailTextField(controller: _emailController),
                SizedBox(height: height * 0.02),

                // Password TextField
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Password",
                      style: LoginStyles.labelStyle(context),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Forgot Password screen
                        Navigator.pushNamed(context, "/forgot-password");
                      },
                      child: Text(
                        "Forgot password?",
                        style: LoginStyles.clickableLabelStyle(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                PasswordTextField(controller: _passwordController),
                SizedBox(height: height * 0.02),

                //Remember user
                ValueListenableBuilder<bool>(
                  valueListenable: _keepSignedIn,
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        Checkbox(
                          value: value,
                          activeColor: AppColors.primary,
                          onChanged: (newValue) {
                            _keepSignedIn.value = newValue ?? false;
                          },
                        ),
                        Text(
                          "Keep me signed in",
                          style: LoginStyles.checkboxLabelStyle(context),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: height * 0.02),

                // Login Button
                Center(
                  child: CustomButton(
                    title: "Login",
                    isTapped: false,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        widget.controller.login(
                          context,
                          _emailController.text,
                          _passwordController.text,
                          _keepSignedIn.value,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),

                //Google sign in
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.2,
                          color: LoginStyles.dividerColor,
                        ),
                      ),

                      SizedBox(width: 12),

                      Text(
                        AppStrings.loginAltText,
                        style: LoginStyles.orSignInStyle(context),
                      ),
                      SizedBox(width: 12),

                      Expanded(
                        child: Divider(
                          thickness: 1.2,
                          color: LoginStyles.dividerColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                //Google button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: LoginStyles.googleButtonStyle,
                    onPressed: () {
                      // widget.controller.signInWithGoogle(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(FontAwesomeIcons.google,color:Colors.red.withOpacity(0.3),size: 20),
                        const SizedBox(width: 10),
                        Text(
                          AppStrings.loginGoogleText,
                          style: LoginStyles.googleButtonTextStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),

                Center(
                 child:  TextButton(
                    onPressed: () {
                      //Navigate to sign up
                    },
                    child: const Text(
                      AppStrings.registerText,
                      style: LoginStyles.registerButtonText,
                    ),
                  ),


                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
