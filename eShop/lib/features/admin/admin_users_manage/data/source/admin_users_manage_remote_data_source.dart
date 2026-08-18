import 'package:dio/dio.dart';
import 'package:eshop/features/admin/admin_users_manage/data/model/admin_users_manage_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/network/api_wrapper.dart';
part 'admin_users_manage_remote_data_source.g.dart';
@RestApi()
abstract class AdminUsersManageRemoteDataSource {
  factory AdminUsersManageRemoteDataSource(Dio dio) =
      _AdminUsersManageRemoteDataSource;
  @GET("/users/")
  Future<ApiWrapper<List<AdminUsersManageModel>>> fetchAllUsers();
  @DELETE("/users/{id}")
  Future<void> disableUsers(@Path() String id);
  @PATCH("/users/active/{id}")
  Future<ApiWrapper<AdminUsersManageModel>> fetchSingleUser(@Path() String id);
}