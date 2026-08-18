import '../entity/nodata_entity.dart';
import 'usecase.dart';
class ResetPasswordUsecase
    implements UseCase<DirectEntity, UserResetPasswordReq> {
  final AuthRepository _authRepository;
  const ResetPasswordUsecase(this._authRepository);
  @override
  ResultFuture<DirectEntity> call(UserResetPasswordReq params) async {
    return await _authRepository.resetPassword(params);
  }
}