class AppStrings {
  static const appName = "Welcome App";

  static const welcomeMessageTitle = "Welcome to the App";
  static const welcomeMessageText="We are excited to help you book and manage your service appointment with ease.";


  static const registerText = "Create an account";

  static const loginTitle= "Login";
  static const loginText="Welcome back to the app";
  static const loginGoogleText="Continue with Google";
  static const loginAltText="or sign in with";


}

class LandingCarouselItems {
  static const List<Map<String, String>> items = [
    {
      "image": "assets/images/item1.png",
      "title": "Welcome to the App",
      "paragraph": "We are excited to help you book and manage your service appointment with ease."  // from welcomeMessageText
    },
    {
      "image": "assets/images/item2.png",
      "title": "Fast & Secure",
      "paragraph": "Experience seamless performance and security."
    },
    {
      "image": "assets/images/item3.png",
      "title": "Get Started",
      "paragraph": "Sign up and enjoy all our services."
    },
  ];
}
