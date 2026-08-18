part of 'auth_bloc.dart';
abstract class AuthState {
  final String? email;
  final String? password;
  final String? errorMessage;
  const AuthState({
    this.email,
    this.password,
    this.errorMessage,
  });
}
class Authenticated extends AuthState {
  final UserEntity user;
  Authenticated({
    required this.user,
  });
}
class UnAuthenticated extends AuthState {
  const UnAuthenticated();
}
class AuthInitial extends AuthState {
  const AuthInitial({super.email, super.password, super.errorMessage});
}
class AuthLoading extends AuthState {
  const AuthLoading({super.email, super.password, super.errorMessage});
}
class AuthSuccess extends AuthState {
  final String message;
  const AuthSuccess({
    required this.message,
    super.email,
    super.password,
  });
}
class AuthNeedsVerification extends AuthState {
  const AuthNeedsVerification(
      {super.email, super.password, super.errorMessage});
}
class AuthVerificationSent extends AuthState {
  final String message;
  const AuthVerificationSent({
    required this.message,
    super.email,
    super.password,
  });
}
class AuthVerificationFailure extends AuthState {
  final String message;
  const AuthVerificationFailure({
    required this.message,
    super.email,
    super.password,
  });
}
class AuthResetFailure extends AuthState {
  final String message;
  const AuthResetFailure({
    required this.message,
    super.email,
    super.password,
  });
}
class AuthFailure extends AuthState {
  final int? statusCode;
  const AuthFailure({
    this.statusCode,
    required String message,
    super.email,
    super.password,
  }) : super(errorMessage: message);
}
class AuthCacheFailure extends AuthState {
  final int? statusCode;
  const AuthCacheFailure({
    this.statusCode,
    required String message,
    super.email,
    super.password,
  }) : super(errorMessage: message);
}