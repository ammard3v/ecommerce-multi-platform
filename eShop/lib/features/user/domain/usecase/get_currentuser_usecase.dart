import '../../../../common/entity/user_entity.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/user_repository.dart';
class GetCurrentUserUsecase implements UseCase<UserEntity?, NoParams> {
  final UserRepository _userRepository;
  const GetCurrentUserUsecase(this._userRepository);
  @override
  ResultFuture<UserEntity?> call(NoParams params) async {
    return await _userRepository.getCurrentUser();
  }
}