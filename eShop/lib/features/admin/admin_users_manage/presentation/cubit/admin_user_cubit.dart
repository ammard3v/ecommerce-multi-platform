import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eshop/features/admin/admin_users_manage/data/model/admin_users_manage_model.dart';
import 'package:eshop/features/admin/admin_users_manage/domain/repo/admin_users_manage_repository.dart';
import 'package:eshop/features/admin/admin_users_manage/presentation/cubit/admin_user_state.dart';
class AdminUserCubit extends Cubit<AdminUserCubitState> {
  final Dio dio;
  final AdminUsersManageRepository adminUsersManageRepository;
  AdminUserCubit({
    required this.dio,
    required this.adminUsersManageRepository,
  }) : super(AdminUserCubitState());
  Future<void> fetchAllUsers() async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await adminUsersManageRepository.fetchaAllUsers();
      response.fold(
          (error) => emit(state.copyWith(
                isLoading: false,
                error: error.message,
              )),
          (users) => emit(
              state.copyWith(isLoading: false, users: users, error: null)));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
  Future<void> fetchSingleUser(String id) async {
    emit(state.copyWith(isLoading: true));
    final currentUsers = List<AdminUsersManageModel>.from(state.users);
    try {
      final response = await adminUsersManageRepository.fetchSingleUser(id);
      response.fold(
          (error) => emit(state.copyWith(
                isLoading: false,
                error: error.message,
              )), (user) {
        final index = currentUsers.indexWhere((e) => e.id == id);
        if (index != -1) {
          currentUsers[index] = user;
        }
        emit(
            state.copyWith(error: null, isLoading: false, users: currentUsers));
      });
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
  Future<void> disableUser(String id) async {
    emit(state.copyWith(isLoading: true));
    final currentUsers = List<AdminUsersManageModel>.from(state.users);
    try {
      final response = await adminUsersManageRepository.disableUser(id);
      response.fold(
          (error) => emit(
                state.copyWith(
                  isLoading: false,
                  error: error.message,
                ),
              ), (_) {
        final index = currentUsers.indexWhere((e) => e.id == id);
        if (index != -1) {
          currentUsers[index] = currentUsers[index].copyWith(active: false);
        }
        emit(
            state.copyWith(isLoading: false, error: null, users: currentUsers));
      });
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}