class RequiredEmail {
  final String email;
  RequiredEmail({
    required this.email,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
    };
  }
}