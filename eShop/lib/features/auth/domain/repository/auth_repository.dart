import '../../data/model/resend_otp_req.dart';
import '../../data/model/google_signin_req.dart';
import '../../data/model/required_email.dart';
import '../entity/nodata_entity.dart';
import '../../data/source/source.dart';
import '../../../../core/usecase/typedef.dart';
import '../entity/auth_entity.dart';
abstract class AuthRepository {
  ResultFuture<AuthEntity> signIn(UserSigninReq userSigninReq);
  ResultFuture<AuthEntity?> signInWithGoogle();
  ResultFuture<DirectEntity> signUp(UserSignupReq userSignupReq);
  ResultVoid logout();
  ResultFuture<AuthEntity> verifyEmail(
    UserVerifyAccountReq userVerifyAccountReq,
  );
  ResultFuture<DirectEntity> resetPassword(
    UserResetPasswordReq userResetPasswordReq,
  );
  ResultFuture<DirectEntity> resendOtp(ResendOtpReq resendOtpReq);
  ResultFuture<DirectEntity> forgotPassword(RequiredEmail requiredEmail);
}