import '../model/resend_otp_req.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../model/google_signin_req.dart';
import '../model/required_email.dart';
import '../../domain/entity/nodata_entity.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../presentation/bloc/auth_bloc.dart';
import 'package:retrofit/retrofit.dart';
import 'source.dart';
part 'auth_remote_data_source.g.dart';
@RestApi()
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;
  @POST("/auth/signIn/")
  Future<ApiWrapper<AuthModel>> signIn(@Body() UserSigninReq userSigninReq);
  @POST("/auth/signUp/")
  Future<DirectModel> signUp(@Body() UserSignupReq userSignupReq);
  @POST("/auth/token/")
  Future<ApiWrapper<AuthModel>> getToken(@Body() UserSignupReq userSignupReq);
  @DELETE("/auth/logout/")
  Future<void> logout(@Body() UserTokenReq userTokenReq);
  @POST("/auth/verifyAccount/")
  Future<ApiWrapper<AuthModel>> verifyEmail(
      @Body() UserVerifyAccountReq userVerifyAccountReq);
  @POST("/auth/resend-otp/")
  Future<DirectModel> resendOtp(@Body() ResendOtpReq resendOtpReq);
  @POST("/auth/forgotPassword/")
  Future<DirectModel> forgotPassword(@Body() RequiredEmail requiredEmail);
  @POST("/auth/resetPassword/")
  Future<DirectModel> resetPassword(
    @Body() UserResetPasswordReq userResetPasswordReq,
  );
  @POST("/auth/googleSignUp/")
  Future<ApiWrapper<AuthModel?>> signInWithGoogle(
      @Body() GoogleSigninReq googleSigninReq);
}