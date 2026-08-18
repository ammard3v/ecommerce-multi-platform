import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/entity/user_entity.dart';
import '../../common/cubits/app_user/app_user_cubit.dart';
class GlobalUser {
  GlobalUser._();
  static String? userId(BuildContext context) {
    final state = context.read<AppUserCubit>().state;
    if (state is AppUserLoaded) {
      return state.user.id;
    }
    return null;
  }
  static UserEntity? userData(BuildContext context) {
    final state = context.read<AppUserCubit>().state;
    if (state is AppUserLoaded) {
      return state.user;
    }
    return null;
  }
  static bool isAuthenticated(BuildContext context) {
    return context.read<AppUserCubit>().state is AppUserLoaded;
  }
  static bool isAdmin(BuildContext context) {
    final state = context.read<AppUserCubit>().state;
    if (state is AppUserLoaded && state.user.email == "d@d.com") {
      return true;
    }
    return false;
  }
}