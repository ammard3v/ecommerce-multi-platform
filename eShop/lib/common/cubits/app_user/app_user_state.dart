part of 'app_user_cubit.dart';
abstract class AppUserState {
  const AppUserState();
}
class AppUserInitial extends AppUserState {
  const AppUserInitial();
}
class AppUserFailure extends AppUserState {
  final String message;
  const AppUserFailure(this.message);
}
class AppUserLoaded extends AppUserState {
  final UserEntity user;
  const AppUserLoaded(this.user);
}