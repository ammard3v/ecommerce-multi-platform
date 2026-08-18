import 'dart:io';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../user/data/source/user_local_data_source.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/entity/nodata_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/google_signin_req.dart';
import '../model/required_email.dart';
import '../model/resend_otp_req.dart';
import '../source/auth_remote_data_source.dart';
import '../source/source.dart';
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.userLocalDataSource,
  });
  @override
  ResultFuture<DirectEntity> resendOtp(ResendOtpReq resendOtpReq) async {
    try {
      final response = await remoteDataSource.resendOtp(resendOtpReq);
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        return Left(ServerFailure(
          e.response?.data["message"] ?? "Unexpected Error",
          statusCode: e.response?.statusCode ?? 400,
        ));
      }
      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        return Left(ServerFailure(
          "Unexpected Error",
          statusCode: e.response?.statusCode ?? 400,
        ));
      }
      return Left(ServerFailure(
        e.message ?? "Unexpected Error",
        statusCode: e.response?.statusCode ?? 400,
      ));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<AuthEntity> signIn(UserSigninReq userSigninReq) async {
    try {
      final response = await remoteDataSource.signIn(userSigninReq);
      if (!response.data.hasValidTokens) {
        return Left(ServerFailure('Invalid Token from Server'));
      }
      await localDataSource.saveTokens(
        accessToken: response.data.finalAccessToken,
        refreshToken: response.data.finalRefreshToken,
      );
      await localDataSource.saveTokenExpiryTime(response.data.expiresIn!);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.data['message'] ?? e.message;
      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        return Left(ServerFailure(
          "Unexpected Error",
          statusCode: e.response?.statusCode ?? 400,
        ));
      }
      return Left(ServerFailure(message, statusCode: statusCode));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<AuthEntity?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();
      final googleUser = await googleSignIn.authenticate(scopeHint: ['email']);
      final tokens = await googleSignIn.authorizationClient
          .authorizationForScopes(['email']);
      final credential = GoogleAuthProvider.credential(
        idToken: googleUser.authentication.idToken,
        accessToken: tokens?.accessToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;
      if (user == null) {
        throw Exception("Firebase sign-in failed");
      }
      final GoogleSigninReq googleSigninReq = GoogleSigninReq(
        name: user.displayName ?? 'Not Found',
        uid: user.uid,
        email: user.email ?? "Not found",
        phoneNumber: user.phoneNumber,
        photoURL: user.photoURL ?? "Not found ",
        isGoogleSignIn: true,
      );
      final response = await remoteDataSource.signInWithGoogle(googleSigninReq);
      if (response.data == null) {
        return Right(null);
      }
      if (!response.data!.hasValidTokens) {
        return Left(ServerFailure('Invalid Token from Server'));
      }
      await localDataSource.saveTokens(
        accessToken: response.data!.finalAccessToken,
        refreshToken: response.data!.finalRefreshToken,
      );
      await localDataSource.saveTokenExpiryTime(response.data!.expiresIn!);
      return Right(response.data!.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        final message = e.response?.data?['message'] ??
            e.response?.data?['error'] ??
            "Too many requests. Please try again later.";
        return Left(ServerFailure(message));
      }
      return Left(ServerFailure('Unexpected Error Occured!'));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<DirectEntity> signUp(UserSignupReq userSignupReq) async {
    try {
      final response = await remoteDataSource.signUp(userSignupReq);
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.data['message'] ?? e.message;
      return Left(ServerFailure(message, statusCode: statusCode));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<AuthEntity> verifyEmail(
    UserVerifyAccountReq userVerifyAccountReq,
  ) async {
    try {
      final response = await remoteDataSource.verifyEmail(userVerifyAccountReq);
      if (!response.data.hasValidTokens) {
        return Left(ServerFailure('Invalid Token from Server'));
      }
      await localDataSource.saveTokens(
        accessToken: response.data.finalAccessToken,
        refreshToken: response.data.finalRefreshToken,
      );
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data['message'] ?? 'Unexpected error occurred!'));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultVoid logout() async {
    try {
      final refreshToken =
          await localDataSource.getRefreshToken() ?? 'oopsTokenNull';
      UserTokenReq userTokenReq = UserTokenReq(refreshToken: refreshToken);
      await remoteDataSource.logout(userTokenReq);
      await localDataSource.clearTokens();
      await userLocalDataSource.clearUser();
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    } finally {
      await localDataSource.clear();
    }
  }
  @override
  ResultFuture<DirectEntity> forgotPassword(RequiredEmail requiredEmail) async {
    try {
      final response = await remoteDataSource.forgotPassword(requiredEmail);
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<DirectEntity> resetPassword(
    UserResetPasswordReq userResetPasswordReq,
  ) async {
    try {
      final response =
          await remoteDataSource.resetPassword(userResetPasswordReq);
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}