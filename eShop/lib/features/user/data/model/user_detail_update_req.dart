class UserDetailUpdateReq {
  final String name;
  final String phoneNumber;
  UserDetailUpdateReq({
    required this.name,
    required this.phoneNumber,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
  factory UserDetailUpdateReq.fromJson(Map<String, dynamic> map) {
    return UserDetailUpdateReq(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}