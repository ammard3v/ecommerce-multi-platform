import 'package:fpdart/fpdart.dart';
import '../model/user_detail_update_req.dart';
import '../../../../common/entity/user_entity.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/typedef.dart';
import '../model/user_model.dart';
import '../source/user_local_data_source.dart';
import '../source/user_remote_data_source.dart';
import '../../domain/repository/user_repository.dart';
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  ResultFuture<UserEntity> getCurrentUser() async {
    try {
      final response = await remoteDataSource.getCurrentUser();
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(Failure(e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(Failure("Failed to fetch user"));
    }
  }
  @override
  ResultFuture<UserEntity> updateCurrentUser(
      UserDetailUpdateReq userDetailUpdateReq) async {
    try {
      final response =
          await remoteDataSource.updateCurrentUser(userDetailUpdateReq);
      await localDataSource.cacheUser(response.data);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(Failure(e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(Failure("Failed to fetch user"));
    }
  }
  @override
  ResultFuture<UserEntity?> getCachedUser() async {
    try {
      final cached = await localDataSource.getLastUser();
      if (cached == null) {
        return Left(Failure("No cached user found"));
      }
      return Right(cached.toEntity());
    } catch (e) {
      return Left(Failure("Failed to load cached user"));
    }
  }
  @override
  ResultVoid cacheUser(UserEntity user) async {
    try {
      final model = user.toModel();
      await localDataSource.cacheUser(model);
      return const Right(null);
    } catch (e) {
      return Left(Failure("Failed to cache user"));
    }
  }
  @override
  ResultVoid clearUser() async {
    try {
      await localDataSource.clearUser();
      return const Right(null);
    } catch (e) {
      return Left(Failure("Failed to clear user"));
    }
  }
}