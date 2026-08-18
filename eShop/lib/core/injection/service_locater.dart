import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:eshop/features/admin/admin_users_manage/data/repo/admin_users_manage_repository_impl.dart';
import 'package:eshop/features/admin/admin_users_manage/data/source/admin_users_manage_remote_data_source.dart';
import 'package:eshop/features/admin/admin_users_manage/domain/repo/admin_users_manage_repository.dart';
import 'package:eshop/features/admin/admin_users_manage/presentation/cubit/admin_user_cubit.dart';
import 'package:eshop/utils/constants/api_constants.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../network/manager/session_manager.dart';
import '../network/manager/token_manager.dart';
import 'package:get_it/get_it.dart';
import '../../common/cubits/theme/theme_cubit.dart';
import '../routes/app_router.dart';
import '../../common/server_call/server_call.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../app/logger.dart';
import '../../common/cubits/app_user/app_user_cubit.dart';
import '../../common/cubits/internet_connection/internet_connection_cubit.dart';
import 'address_injection.dart';
import 'auth_injection.dart';
import 'cart_injection.dart';
import 'category_injection.dart';
import 'firebase_injection.dart';
import 'notification_injection.dart';
import 'order_injection.dart';
import 'payment_injection.dart';
import 'product_injection.dart';
import 'review_injection.dart';
import 'search_injection.dart';
import 'user_injection.dart';
import 'wishlist_injection.dart';
import '../network/dio_client.dart';
import '../../features/navigation/cubit/navigation_bar_cubit.dart';
import '../../features/shop/cubits/budget_product_cubit.dart';
import '../../features/shop/cubits/featured_product_cubit.dart';
import '../../features/user/domain/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;
Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Logger>(() => Logger());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(sharedPreferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<AppUserCubit>(
      () => AppUserCubit(userRepository: sl<UserRepository>()));
  sl.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(
      baseUrl: Constants.base_url,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )),
    instanceName: 'refreshDio',
  );
  sl.registerLazySingleton<TokenManager>(
    () => TokenManager(
      localDataSource: sl(),
      refreshDio: sl<Dio>(instanceName: 'refreshDio'),
    ),
  );
  sl.registerLazySingleton<SessionManager>(
    () => SessionManager(
      localDataSource: sl(),
      onLogout: () => sl<AuthBloc>().add(Logout()),
    ),
  );
  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(
      tokenManager: sl(),
      sessionManager: sl(),
      refreshDio: sl<Dio>(instanceName: 'refreshDio'),
    ),
  );
  sl.registerLazySingleton<DioClient>(
    () => DioClient(authInterceptor: sl()),
  );
  sl.registerLazySingleton<ServerCall>(
    () => ServerCall(sl<DioClient>().dio),
  );
  await userInjection();
  await authInjection();
  await firebaseInjection();
  await addressInjection();
  await cartInjection();
  await categoryInjection();
  await orderInjection();
  await paymentInjection();
  await productInjection();
  await reviewInjection();
  await searchInjection();
  await notificationInjection();
  await wishlistInjection();
  sl.registerLazySingleton<AppRouter>(
      () => AppRouter(authBloc: sl<AuthBloc>(), logger: sl<Logger>()));
  sl.registerLazySingleton<NavigationBarCubit>(() => NavigationBarCubit());
  sl.registerLazySingleton<InternetConnectionCubit>(
      () => InternetConnectionCubit(
            sl<Connectivity>(),
            dioClient: sl(),
            serverCall: sl(),
          ));
  sl.registerFactory(
      () => FeaturedProductCubit(fetchTopFeaturedProductsUsecase: sl()));
  sl.registerFactory(
      () => BudgetProductCubit(fetchTopBudgetProductsUsecase: sl()));
  sl.registerLazySingleton<AdminUsersManageRemoteDataSource>(
      () => AdminUsersManageRemoteDataSource(sl<DioClient>().dio));
  sl.registerLazySingleton<AdminUsersManageRepository>(
      () => AdminUsersManageRepositoryImpl(
            adminUsersManageRemoteDataSource:
                sl<AdminUsersManageRemoteDataSource>(),
          ));
  sl.registerLazySingleton<AdminUserCubit>(() => AdminUserCubit(
        dio: sl<DioClient>().dio,
        adminUsersManageRepository: sl<AdminUsersManageRepository>(),
      ));
}