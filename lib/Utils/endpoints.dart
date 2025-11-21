class AppEndpoints {
  static const String env = "DEV";

  // BASE URLs
  static const String devBaseUrl = "https://dev";
  static const String testBaseUrl = "https://test";
  static const String prodBaseUrl = "https://prod";

  static String get baseUrl {
    switch (env) {
      case "DEV":
        return devBaseUrl;
      case "TEST":
        return testBaseUrl;
      case "PROD":
        return prodBaseUrl;
      default:
        return devBaseUrl;
    }
  }

  //ENDPOINTS:
  static String get userLogin => "$baseUrl/login";
}
