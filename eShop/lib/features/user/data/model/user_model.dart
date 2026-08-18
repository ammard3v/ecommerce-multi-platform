import '../../../../common/entity/user_entity.dart';
class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    super.phoneNumber,
    super.photo,
    required super.role,
    required super.authProvider,
    required super.isVerified,
    required super.active,
    required super.verificationMethod,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      "photo": photo,
      'role': role,
      'authProvider': authProvider,
      'is_verified': isVerified,
      'active': active,
      'verificationMethod': verificationMethod,
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] as String,
        email: map['email'] as String,
        phoneNumber:
            map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
        photo: map['photo'] != null ? map['photo'] as String : null,
        role: map['role'] as String,
        authProvider: map['authProvider'] as String,
        isVerified: map['is_verified'] as bool,
        active: map['active'] as bool,
        verificationMethod: map['verificationMethod'] as String,
        id: map['id'] as String,
        createdAt: DateTime.parse(map['created_at'] as String),
        updatedAt: DateTime.parse(map['updated_at'] as String));
  }
}
extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
        id: id,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        role: role,
        isVerified: isVerified,
        active: active,
        createdAt: createdAt,
        updatedAt: updatedAt,
        verificationMethod: verificationMethod,
        authProvider: authProvider,
        photo: photo ?? "");
  }
}
extension UserEntityY on UserEntity {
  UserModel toModel() {
    return UserModel(
        id: id,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        role: role,
        isVerified: isVerified,
        active: active,
        createdAt: createdAt,
        updatedAt: updatedAt,
        verificationMethod: verificationMethod,
        authProvider: authProvider,
        photo: photo ?? "");
  }
}