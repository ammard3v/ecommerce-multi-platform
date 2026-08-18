import '../network/dio_client.dart';
import '../../features/user/data/repository/user_repository_impl.dart';
import '../../features/user/data/source/user_local_data_source.dart';
import '../../features/user/data/source/user_remote_data_source.dart';
import '../../features/user/domain/repository/user_repository.dart';
import '../../features/user/domain/usecase/get_currentuser_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service_locater.dart';
Future userInjection() async {
  sl.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(sl<UserRepository>()));
  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(prefs: sl<SharedPreferences>()));
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      remoteDataSource: sl<UserRemoteDataSource>(),
      localDataSource: sl<UserLocalDataSource>()));
}