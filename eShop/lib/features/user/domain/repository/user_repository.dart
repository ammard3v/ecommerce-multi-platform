import '../../data/model/user_detail_update_req.dart';
import '../../../../common/entity/user_entity.dart';
import '../../../../core/usecase/typedef.dart';
abstract class UserRepository {
  ResultFuture<UserEntity> getCurrentUser();
  ResultFuture<UserEntity> updateCurrentUser(
      UserDetailUpdateReq userDetailUpdateReq);
  ResultFuture<UserEntity?> getCachedUser();
  ResultVoid cacheUser(UserEntity user);
  ResultVoid clearUser();
}