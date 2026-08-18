import 'usecase.dart';
class LogOutUsecase implements UseCase<void, NoParams> {
  final AuthRepository _authRepository;
  const LogOutUsecase(this._authRepository);
  @override
  ResultVoid call(NoParams params) async {
    return await _authRepository.logout();
  }
}