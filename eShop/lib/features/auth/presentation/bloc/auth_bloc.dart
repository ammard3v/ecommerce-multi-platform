import 'dart:async';
import 'dart:io';
import '../../data/model/resend_otp_req.dart';
import 'package:intl/intl.dart';
import '../../../../core/firebase/firebase_helper.dart';
import '../../../../common/entity/user_entity.dart';
import '../../data/model/required_email.dart';
import '../../data/source/source.dart';
import '../../../navigation/cubit/navigation_bar_cubit.dart';
import '../../../shop/home/home.dart';
import '../../../../../../common/cubits/app_user/app_user_cubit.dart';
import '../../../user/domain/usecase/get_currentuser_usecase.dart';
import '../../domain/usecase/google_signin_usecase.dart';
import '../../domain/usecase/reset_password_usecase.dart';
import '../../domain/usecase/usecase.dart';
import '../../domain/usecase/verify_email_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SigninUsecase _signinUsecase;
  final SignupUsecase _signupUsecase;
  final VerifyEmailUsecase _verifyEmailUsecase;
  final ResendOtpUsecase _resendOtpUsecase;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final AppUserCubit _appUserCubit;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final ResetPasswordUsecase _resetPasswordUsecase;
  final LogOutUsecase _logoutUsecase;
  final GoogleSigninUsecase _googleSigninUsecase;
  final AuthLocalDataSource authLocalDataSource;
  AuthBloc({
    required SigninUsecase signinUsecase,
    required SignupUsecase signupUsecase,
    required VerifyEmailUsecase verifyEmailUsecase,
    required ResendOtpUsecase resendOtpUsecase,
    required ForgotPasswordUsecase forgotPasswordUsecase,
    required ResetPasswordUsecase resetPasswordUsecase,
    required LogOutUsecase logoutUsecase,
    required GoogleSigninUsecase googleSigninUsecase,
    required GetCurrentUserUsecase getCurrentUserUsecase,
    required AppUserCubit appUserCubit,
    required this.authLocalDataSource,
  })  : _signinUsecase = signinUsecase,
        _signupUsecase = signupUsecase,
        _verifyEmailUsecase = verifyEmailUsecase,
        _resendOtpUsecase = resendOtpUsecase,
        _forgotPasswordUsecase = forgotPasswordUsecase,
        _logoutUsecase = logoutUsecase,
        _resetPasswordUsecase = resetPasswordUsecase,
        _googleSigninUsecase = googleSigninUsecase,
        _getCurrentUserUsecase = getCurrentUserUsecase,
        _appUserCubit = appUserCubit,
        super(const AuthInitial()) {
    on<CheckLoggedIn>(_onCheckLoggedIn);
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
    on<VerifyEmail>(_onVerifyEmail);
    on<ForgotPassword>(_onForgotPassword);
    on<ResetPassword>(_onResetPassword);
    on<ResendOtp>(_onResendOtp);
    on<Logout>(_onLogout);
    on<GoogleSignIn>(_onGoogleAuth);
  }
  Future<void> _onCheckLoggedIn(
    CheckLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final cacheDate = await authLocalDataSource.getTokenExpiryTime();
      if (cacheDate == null) {
        emit(UnAuthenticated());
        return;
      }
      if (cacheDate.isBefore(DateTime.now())) {
        debugPrint('=>Token expired');
        emit(UnAuthenticated());
        return;
      } else {
        debugPrint('=>Token still valid');
      }
      await _appUserCubit.loadUser();
      final userState = _appUserCubit.state;
      if (userState is AppUserLoaded && userState.user.active) {
        emit(Authenticated(user: userState.user));
        return;
      }
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onSignIn(
    SignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final result = await _signinUsecase(event.userSigninReq);
      if (result.isLeft()) {
        final failure = result.fold(
          (l) => l,
          (_) => throw Exception('Unreachable'),
        );
        if (failure.statusCode == 403) {
          emit(AuthNeedsVerification(email: event.userSigninReq.email));
        } else {
          emit(AuthFailure(
            email: event.userSigninReq.email,
            password: event.userSigninReq.password,
            statusCode: failure.statusCode,
            message: failure.message,
          ));
        }
        return;
      }
      final currentUserResult = await _getCurrentUserUsecase(NoParams());
      if (currentUserResult.isLeft()) {
        final failure = currentUserResult.fold(
          (l) => l,
          (_) => throw Exception('Unreachable'),
        );
        emit(AuthFailure(message: failure.message));
        return;
      }
      final user = currentUserResult.fold(
        (_) => throw Exception('Unreachable'),
        (r) => r,
      );
      if (user == null) {
        emit(const AuthFailure(message: 'User is null'));
        return;
      }
      if (!user.active) {
        emit(UnAuthenticated());
        emit(AuthFailure(message: "User is inactive"));
        return;
      }
      await _appUserCubit.setUser(user);
      if (Platform.isAndroid) {
        await sl<FirebaseHelper>().setupfcm();
      }
      emit(AuthSuccess(message: "Login Success"));
      emit(Authenticated(user: user));
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onGoogleAuth(
    GoogleSignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final result = await _googleSigninUsecase();
      await result.fold(
        (failure) async {
          emit(AuthFailure(message: failure.message));
        },
        (res) async {
          if (res == null) {
            emit(const AuthFailure(message: 'Google Auth Failure'));
            return;
          }
          final currentUserResult = await _getCurrentUserUsecase(NoParams());
          if (currentUserResult.isLeft()) {
            final failure = currentUserResult.fold(
              (l) => l,
              (_) => throw Exception('Unreachable'),
            );
            emit(AuthFailure(message: failure.message));
            return;
          }
          final user = currentUserResult.fold(
            (_) => throw Exception('Unreachable'),
            (r) => r,
          );
          if (user == null) {
            emit(const AuthFailure(message: 'User is null'));
            return;
          }
          if (!user.active) {
            emit(UnAuthenticated());
            emit(AuthFailure(message: "User is inactive"));
            return;
          }
          await _appUserCubit.setUser(user);
          if (Platform.isAndroid) {
            await sl<FirebaseHelper>().setupfcm();
          }
          emit(Authenticated(user: user));
        },
      );
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onSignUp(
    SignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final result = await _signupUsecase(event.userSignupReq);
      await result.fold(
        (failure) async {
          emit(AuthFailure(
            message: failure.message,
            statusCode: failure.statusCode,
          ));
        },
        (_) async {
          emit(AuthNeedsVerification(email: event.userSignupReq.email));
        },
      );
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onVerifyEmail(
    VerifyEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final result = await _verifyEmailUsecase(event.userVerifyAccountReq);
      await result.fold(
          (failure) async =>
              emit(AuthVerificationFailure(message: failure.message)),
          (response) async {
        final currentUserResult = await _getCurrentUserUsecase(NoParams());
        if (currentUserResult.isLeft()) {
          final failure = currentUserResult.fold(
            (l) => l,
            (_) => throw Exception('Unreachable'),
          );
          emit(AuthFailure(message: failure.message));
          return;
        }
        final user = currentUserResult.fold(
          (_) => throw Exception('Unreachable'),
          (r) => r,
        );
        if (user == null) {
          emit(const AuthFailure(message: 'User is null'));
          return;
        }
        if (!user.active) {
          emit(UnAuthenticated());
          emit(AuthFailure(message: "User is inactive"));
          return;
        }
        emit(AuthSuccess(message: "Login Success"));
        await _appUserCubit.setUser(user);
      });
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onResetPassword(
      ResetPassword event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final result = await _resetPasswordUsecase(event.userResetPasswordReq);
      result.fold((failure) => emit(AuthResetFailure(message: failure.message)),
          (success) => emit(AuthSuccess(message: "Reset succeess")));
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onResendOtp(ResendOtp event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final result = await _resendOtpUsecase(event.resendOtpReq);
      await result.fold(
        (failure) async =>
            emit(AuthVerificationFailure(message: failure.message)),
        (success) async =>
            emit(AuthVerificationSent(message: "Otp Sent Successfully.")),
      );
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onForgotPassword(
      ForgotPassword event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final result =
          await _forgotPasswordUsecase(RequiredEmail(email: event.email));
      result.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (success) => emit(AuthVerificationSent(
            message: "onforgot success", email: event.email)),
      );
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
  Future<void> _onLogout(
    Logout event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final result = await _logoutUsecase(NoParams());
      await result.fold(
        (failure) async {
          emit(AuthFailure(
            message: failure.message,
            statusCode: failure.statusCode,
          ));
        },
        (_) async {
          await _appUserCubit.clearUser();
          await authLocalDataSource.clear();
          sl.get<AddressBloc>().add(AddressResetEvent());
          sl.get<NavigationBarCubit>().selectedNavigation(0);
          emit(const UnAuthenticated());
        },
      );
    } catch (e) {
      emit(AuthFailure(message: 'Unexpected error: $e'));
    }
  }
}