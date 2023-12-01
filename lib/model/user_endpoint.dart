class Endpoint {
  static const String baseUrl = "https://reqres.in/api";
  static const String users = "/users";
  static const String register = "/register";

  // Timeout values
  static const Duration receiveTimeout =
      Duration(hours: 2, minutes: 3, seconds: 2);
  static const Duration connectionTimeout =
      Duration(hours: 2, minutes: 3, seconds: 2);
}
