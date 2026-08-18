import 'usecase.dart';
class GoogleSigninUsecase implements UseCaseWithoutParams<AuthEntity?> {
  final AuthRepository _authRepository;
  const GoogleSigninUsecase(this._authRepository);
  @override
  ResultFuture<AuthEntity?> call() async {
    return await _authRepository.signInWithGoogle();
  }
}