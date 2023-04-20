import 'dart:convert';

class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
  });

  static LoginRequest loginRequestFromJson(String str) =>
      LoginRequest.fromJson(json.decode(str));

  static String loginRequestToJson(LoginRequest data) =>
      json.encode(data.toJson());

  final String email;
  final String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
