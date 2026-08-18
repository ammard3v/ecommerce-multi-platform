import 'dart:convert';
class GoogleSigninReq {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  String? phoneNumber;
  final bool isGoogleSignIn;
  GoogleSigninReq({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.phoneNumber,
    required this.isGoogleSignIn,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'photoURL': photoURL,
      'phoneNumber': phoneNumber,
      'isGoogleSignIn': isGoogleSignIn,
    };
  }
}