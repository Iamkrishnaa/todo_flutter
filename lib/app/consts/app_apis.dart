String baseURL = "http://10.0.2.2:8080/api/v1";

class AppApis {
  static String get login => "$baseURL/auth/login";
  static String get register => "$baseURL/auth/register";
  static String get refreshToken => "$baseURL/auth/refresh";

  static String get getAllTodos => "$baseURL/todos/all";
}
