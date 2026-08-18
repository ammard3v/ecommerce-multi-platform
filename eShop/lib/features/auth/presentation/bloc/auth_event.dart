part of 'auth_bloc.dart';
abstract class AuthEvent {
  const AuthEvent();
}
class CheckLoggedIn extends AuthEvent {
  const CheckLoggedIn();
}
class SignIn extends AuthEvent {
  final UserSigninReq userSigninReq;
  const SignIn({required this.userSigninReq});
}
class GoogleSignIn extends AuthEvent {
  const GoogleSignIn();
}
class SignUp extends AuthEvent {
  final UserSignupReq userSignupReq;
  const SignUp({required this.userSignupReq});
}
class VerifyEmail extends AuthEvent {
  final UserVerifyAccountReq userVerifyAccountReq;
  const VerifyEmail({required this.userVerifyAccountReq});
}
class ResendOtp extends AuthEvent {
  final ResendOtpReq resendOtpReq;
  const ResendOtp({required this.resendOtpReq});
}
class ForgotPassword extends AuthEvent {
  final String email;
  const ForgotPassword({required this.email});
}
class ResetPassword extends AuthEvent {
  final UserResetPasswordReq userResetPasswordReq;
  ResetPassword({
    required this.userResetPasswordReq,
  });
}
class Logout extends AuthEvent {
  const Logout();
}