import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_users_manage_model.freezed.dart';
part 'admin_users_manage_model.g.dart';
@freezed
abstract class AdminUsersManageModel with _$AdminUsersManageModel {
  const factory AdminUsersManageModel({
    required String name,
    required String email,
    required String role,
    required String authProvider,
    @JsonKey(name: 'is_verified') required bool isVerified,
    required bool active,
    required String verificationMethod,
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? phoneNumber,
    String? photo,
    String? verificationOTP,
    @JsonKey(name: 'verificationOTPExpires') DateTime? verificationOTPExpires,
  }) = _AdminUsersManageModel;
  factory AdminUsersManageModel.fromJson(Map<String, dynamic> json) =>
      _$AdminUsersManageModelFromJson(json);
}