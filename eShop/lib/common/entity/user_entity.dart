import 'dart:convert';
import 'package:equatable/equatable.dart';
class UserEntity extends Equatable {
  final String name;
  final String email;
  final String? phoneNumber;
  final String role;
  final String authProvider;
  final bool isVerified;
  final bool active;
  final String verificationMethod;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? photo;
  const UserEntity({
    required this.name,
    required this.email,
    this.phoneNumber,
    required this.role,
    required this.authProvider,
    required this.isVerified,
    required this.active,
    required this.verificationMethod,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.photo,
  });
  @override
  List<Object?> get props => [
    name,
    email,
    phoneNumber,
    role,
    authProvider,
    isVerified,
    active,
    verificationMethod,
    id,
    createdAt,
    updatedAt,
    photo,
  ];
  bool get hasValidPhoneNumber =>
      phoneNumber != null && phoneNumber!.isNotEmpty;
}