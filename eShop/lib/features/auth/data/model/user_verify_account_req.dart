class UserVerifyAccountReq {
  final String email;
  final String otp;
  const UserVerifyAccountReq({
    required this.email,
    required this.otp,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'otp': otp,
    };
  }
}