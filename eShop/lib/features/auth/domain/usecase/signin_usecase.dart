import 'usecase.dart';
class SigninUsecase implements UseCase<AuthEntity, UserSigninReq> {
  final AuthRepository _authRepository;
  const SigninUsecase(this._authRepository);
  @override
  ResultFuture<AuthEntity> call(UserSigninReq params) async {
    return await _authRepository.signIn(params);
  }
}