import 'package:shared_preferences/shared_preferences.dart';
import '../../common/cubits/app_user/app_user_cubit.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/data/source/auth_local_data_source.dart';
import '../../features/auth/data/source/auth_remote_data_source.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/forgot_password_usecase.dart';
import '../../features/auth/domain/usecase/google_signin_usecase.dart';
import '../../features/auth/domain/usecase/log_out_usecase.dart';
import '../../features/auth/domain/usecase/resend_otp_usecase.dart';
import '../../features/auth/domain/usecase/reset_password_usecase.dart';
import '../../features/auth/domain/usecase/signin_usecase.dart';
import '../../features/auth/domain/usecase/signup_usecase.dart';
import '../../features/auth/domain/usecase/verify_email_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/user/data/source/user_local_data_source.dart';
import '../../features/user/domain/usecase/get_currentuser_usecase.dart';
import '../network/dio_client.dart';
import '../network/network.dart';
import 'service_locater.dart';
Future authInjection() async {
  sl.registerLazySingleton<SigninUsecase>(
      () => SigninUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<SignupUsecase>(
      () => SignupUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<VerifyEmailUsecase>(
      () => VerifyEmailUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<ResendOtpUsecase>(
      () => ResendOtpUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<ForgotPasswordUsecase>(
      () => ForgotPasswordUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<LogOutUsecase>(
      () => LogOutUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<ResetPasswordUsecase>(
      () => ResetPasswordUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<GoogleSigninUsecase>(
      () => GoogleSigninUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(
        sl<DioClient>().dio,
      ));
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(
        prefs: sl<SharedPreferences>(),
      ));
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(
        signinUsecase: sl<SigninUsecase>(),
        verifyEmailUsecase: sl<VerifyEmailUsecase>(),
        signupUsecase: sl<SignupUsecase>(),
        resendOtpUsecase: sl<ResendOtpUsecase>(),
        forgotPasswordUsecase: sl<ForgotPasswordUsecase>(),
        logoutUsecase: sl<LogOutUsecase>(),
        resetPasswordUsecase: sl<ResetPasswordUsecase>(),
        googleSigninUsecase: sl<GoogleSigninUsecase>(),
        appUserCubit: sl<AppUserCubit>(),
        getCurrentUserUsecase: sl<GetCurrentUserUsecase>(),
        authLocalDataSource: sl(),
      ));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: sl<AuthRemoteDataSource>(),
        localDataSource: sl<AuthLocalDataSource>(),
        userLocalDataSource: sl<UserLocalDataSource>(),
      ));
}