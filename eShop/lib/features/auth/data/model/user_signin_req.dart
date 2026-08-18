import 'dart:convert';
class UserSigninReq {
  final String email;
  final String password;
  UserSigninReq({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
  @override
  String toString() => jsonEncode(toJson());
}