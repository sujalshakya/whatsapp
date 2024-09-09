import 'dart:convert';

class RegisterRequest {
  String username;
  String password;
  String fullName;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.fullName,
  });

  factory RegisterRequest.fromRawJson(String str) =>
      RegisterRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        username: json["username"],
        password: json["password"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "full_name": fullName,
      };
}
