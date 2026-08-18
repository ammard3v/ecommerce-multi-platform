import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/user/data/model/user_detail_update_req.dart';
import '../../../features/user/domain/repository/user_repository.dart';
import '../../entity/user_entity.dart';
part 'app_user_state.dart';
class AppUserCubit extends Cubit<AppUserState> {
  final UserRepository userRepository;
  AppUserCubit({
    required this.userRepository,
  }) : super(const AppUserInitial());
  Future<void> loadUser() async {
    if (state is AppUserLoaded) return;
    final result = await userRepository.getCachedUser();
    result.fold(
      (failure) => emit(AppUserFailure(failure.message)),
      (user) {
        if (user == null) {
          if (user!.active) {
            emit(AppUserFailure("User is not Active"));
          }
          emit(AppUserInitial());
        } else {
          emit(AppUserLoaded(user));
        }
      },
    );
  }
  Future<void> setUser(UserEntity user) async {
    final result = await userRepository.cacheUser(user);
    result.fold(
      (failure) => emit(AppUserFailure(failure.message)),
      (_) => emit(AppUserLoaded(user)),
    );
  }
  Future<void> updateUser(UserDetailUpdateReq userDetailUpdateReq) async {
    final result = await userRepository.updateCurrentUser(userDetailUpdateReq);
    result.fold(
      (failure) => emit(AppUserFailure(failure.message)),
      (response) => emit(AppUserLoaded(response)),
    );
  }
  Future<void> clearUser() async {
    final result = await userRepository.clearUser();
    result.fold(
      (failure) => emit(AppUserFailure(failure.message)),
      (_) => emit(AppUserInitial()),
    );
  }
}