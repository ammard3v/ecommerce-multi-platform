import 'dart:convert';
class DirectEntity {
  final String status;
  final String message;
  DirectEntity({
    required this.status,
    required this.message,
  });
}
class DirectModel {
  final String status;
  final String message;
  DirectModel({
    required this.status,
    required this.message,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }
  factory DirectModel.fromJson(Map<String, dynamic> map) {
    return DirectModel(
      status: map['status'] as String,
      message: map['message'] as String,
    );
  }
}
extension ForgotPasswordModelX on DirectModel {
  DirectEntity toEntity() {
    return DirectEntity(
      status: status,
      message: message,
    );
  }
}