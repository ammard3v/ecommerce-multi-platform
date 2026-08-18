import 'package:equatable/equatable.dart';
import '../../domain/entity/auth_entity.dart';
class AuthModel extends AuthEntity {
  const AuthModel({
    required super.email,
    required super.role,
    required super.active,
    required super.isVerified,
    required super.userId,
    required super.username,
    super.accessToken,
    super.refreshToken,
    super.expiresIn,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'username': username,
      'email': email,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_in': expiresIn,
      'role': role,
      'active': active,
      'is_verified': isVerified,
    };
  }
  factory AuthModel.fromJson(Map<String, dynamic> map) {
    return AuthModel(
      userId: map['user_id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      accessToken:
          map['access_token'] != null ? map['access_token'] as String : null,
      refreshToken:
          map['refresh_token'] != null ? map['refresh_token'] as String : null,
      expiresIn: map['expires_in'] != null
          ? DateTime.parse(map['expires_in'] as String)
          : null,
      role: map['role'] as String,
      active: map['active'] as bool,
      isVerified: map['is_verified'] as bool,
    );
  }
}
extension AuthModelX on AuthModel {
  AuthEntity toEntity() {
    return AuthEntity(
      email: email,
      role: role,
      active: active,
      isVerified: isVerified,
      userId: userId,
      username: username,
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
    );
  }
}
extension AuthModelHelper on AuthModel {
  String get finalAccessToken => accessToken ?? '';
  String get finalRefreshToken => refreshToken ?? '';
  bool get hasValidTokens =>
      finalAccessToken.isNotEmpty && finalRefreshToken.isNotEmpty;
  DateTime get tokenExpiryTime => expiresIn ?? DateTime.now();
}