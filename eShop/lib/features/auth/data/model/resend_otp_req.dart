class ResendOtpReq {
  final String email;
  const ResendOtpReq({
    required this.email,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
    };
  }
}