import 'dart:convert';

class RegisterRequest {
  RegisterRequest({
    required this.username,
    required this.password,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
  });

  final String username;
  final String password;
  final String email;
  final String fullName;
  final String phoneNumber;

  static RegisterRequest registerRequestFromJson(String str) =>
      RegisterRequest.fromJson(json.decode(str));

  static String registerRequestToJson(RegisterRequest data) =>
      json.encode(data.toJson());

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
      };
}
