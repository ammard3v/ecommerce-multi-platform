part of 'admin_users_manage_model.dart';
_AdminUsersManageModel _$AdminUsersManageModelFromJson(
        Map<String, dynamic> json) =>
    _AdminUsersManageModel(
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      authProvider: json['authProvider'] as String,
      isVerified: json['is_verified'] as bool,
      active: json['active'] as bool,
      verificationMethod: json['verificationMethod'] as String,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      photo: json['photo'] as String?,
      verificationOTP: json['verificationOTP'] as String?,
      verificationOTPExpires: json['verificationOTPExpires'] == null
          ? null
          : DateTime.parse(json['verificationOTPExpires'] as String),
    );
Map<String, dynamic> _$AdminUsersManageModelToJson(
        _AdminUsersManageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'authProvider': instance.authProvider,
      'is_verified': instance.isVerified,
      'active': instance.active,
      'verificationMethod': instance.verificationMethod,
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'photo': instance.photo,
      'verificationOTP': instance.verificationOTP,
      'verificationOTPExpires':
          instance.verificationOTPExpires?.toIso8601String(),
    };
