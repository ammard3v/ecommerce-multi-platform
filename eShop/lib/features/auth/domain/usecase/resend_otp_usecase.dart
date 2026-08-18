import '../../data/model/resend_otp_req.dart';
import '../entity/nodata_entity.dart';
import 'usecase.dart';
class ResendOtpUsecase implements UseCase<DirectEntity, ResendOtpReq> {
  final AuthRepository _authRepository;
  const ResendOtpUsecase(this._authRepository);
  @override
  ResultFuture<DirectEntity> call(ResendOtpReq params) async {
    return await _authRepository.resendOtp(params);
  }
}