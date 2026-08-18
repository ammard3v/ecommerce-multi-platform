import 'usecase.dart';
class VerifyEmailUsecase implements UseCase<AuthEntity, UserVerifyAccountReq> {
  final AuthRepository _authRepository;
  const VerifyEmailUsecase(this._authRepository);
  @override
  ResultFuture<AuthEntity> call(UserVerifyAccountReq params) async {
    return await _authRepository.verifyEmail(params);
  }
}