import 'package:eshop/features/admin/admin_users_manage/data/model/admin_users_manage_model.dart';
import '../../../../../core/usecase/typedef.dart';
abstract class AdminUsersManageRepository {
  ResultFuture<List<AdminUsersManageModel>> fetchaAllUsers();
  ResultFuture<AdminUsersManageModel> fetchSingleUser(String id);
  ResultFuture<void> disableUser(String id);
}