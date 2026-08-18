import '../entity/nodata_entity.dart';
import 'usecase.dart';
class SignupUsecase implements UseCase<DirectEntity, UserSignupReq> {
  final AuthRepository _authRepository;
  const SignupUsecase(this._authRepository);
  @override
  ResultFuture<DirectEntity> call(UserSignupReq params) async {
    return await _authRepository.signUp(params);
  }
}