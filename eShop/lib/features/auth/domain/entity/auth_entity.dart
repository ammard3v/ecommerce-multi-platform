import 'package:equatable/equatable.dart';
class AuthEntity extends Equatable {
  final String userId;
  final String username;
  final String email;
  final String role;
  final bool active;
  final bool isVerified;
  final String? accessToken;
  final String? refreshToken;
  final DateTime? expiresIn;
  const AuthEntity({
    required this.email,
    required this.role,
    required this.active,
    required this.isVerified,
    required this.userId,
    required this.username,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  });
  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        accessToken,
        refreshToken,
        expiresIn,
        role,
        active,
        isVerified,
      ];
}