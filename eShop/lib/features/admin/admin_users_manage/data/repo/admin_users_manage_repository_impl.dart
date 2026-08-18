import 'package:eshop/core/error/exceptions.dart';
import 'package:eshop/core/error/failures.dart';
import 'package:eshop/core/usecase/typedef.dart';
import 'package:eshop/features/admin/admin_users_manage/data/model/admin_users_manage_model.dart';
import 'package:eshop/features/admin/admin_users_manage/data/source/admin_users_manage_remote_data_source.dart';
import 'package:eshop/features/admin/admin_users_manage/domain/repo/admin_users_manage_repository.dart';
import 'package:fpdart/fpdart.dart';
class AdminUsersManageRepositoryImpl extends AdminUsersManageRepository {
  final AdminUsersManageRemoteDataSource adminUsersManageRemoteDataSource;
  AdminUsersManageRepositoryImpl(
      {required this.adminUsersManageRemoteDataSource});
  @override
  ResultFuture<List<AdminUsersManageModel>> fetchaAllUsers() async {
    try {
      final response = await adminUsersManageRemoteDataSource.fetchAllUsers();
      return Right(response.data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<void> disableUser(String id) async {
    try {
      await adminUsersManageRemoteDataSource.disableUsers(id);
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<AdminUsersManageModel> fetchSingleUser(String id) async {
    try {
      final response =
          await adminUsersManageRemoteDataSource.fetchSingleUser(id);
      return Right(response.data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}