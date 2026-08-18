import '../../data/model/required_email.dart';
import '../entity/nodata_entity.dart';
import 'usecase.dart';
class ForgotPasswordUsecase implements UseCase<DirectEntity, RequiredEmail> {
  final AuthRepository _authRepository;
  const ForgotPasswordUsecase(this._authRepository);
  @override
  ResultFuture<DirectEntity> call(RequiredEmail params) async {
    return await _authRepository.forgotPassword(params);
  }
}