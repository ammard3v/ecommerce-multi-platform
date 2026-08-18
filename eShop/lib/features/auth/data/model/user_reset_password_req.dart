class UserResetPasswordReq {
  final String email;
  final String otp;
  final String password;
  final String passwordConfirm;
  const UserResetPasswordReq({
    required this.email,
    required this.otp,
    required this.password,
    required this.passwordConfirm,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'otp': otp,
      'password': password,
      'passwordConfirm': passwordConfirm,
    };
  }
}