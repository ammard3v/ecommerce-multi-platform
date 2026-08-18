import 'package:eshop/features/admin/admin_users_manage/data/model/admin_users_manage_model.dart';
class AdminUserCubitState {
  final bool isLoading;
  final List<AdminUsersManageModel> users;
  final String? error;
  AdminUserCubitState({
    this.isLoading = false,
    this.users = const [],
    this.error,
  });
  AdminUserCubitState copyWith(
      {bool? isLoading, List<AdminUsersManageModel>? users, String? error}) {
    return AdminUserCubitState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}