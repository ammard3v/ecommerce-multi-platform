import 'dart:convert';
class UserTokenReq {
  final String refreshToken;
  UserTokenReq({
    required this.refreshToken,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'refresh_token': refreshToken,
    };
  }
}