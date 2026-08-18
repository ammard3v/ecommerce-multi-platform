import '../../data/model/user_detail_update_req.dart';
import '../../../../common/entity/user_entity.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/user_repository.dart';
class UpdateCurrentuserUsecase
    implements UseCase<UserEntity, UserDetailUpdateReq> {
  final UserRepository _userRepository;
  const UpdateCurrentuserUsecase(this._userRepository);
  @override
  ResultFuture<UserEntity> call(UserDetailUpdateReq params) async {
    return await _userRepository.updateCurrentUser(params);
  }
}