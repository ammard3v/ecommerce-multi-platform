class UserSignupReq {
  final String email;
  final String password;
  final String passwordConfirm;
  final String name;
  String? phoneNumber;
  String? address;
  String? city;
  String? state;
  UserSignupReq({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.name,
    this.phoneNumber,
    this.address,
    this.city,
    this.state,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'state': state,
    };
  }
}