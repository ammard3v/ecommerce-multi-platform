import 'package:flutter/cupertino.dart';
import '../../features/cart/data/repository/cart_repository_impl.dart';
import '../../features/cart/data/source/cart_remote_data_source.dart';
import '../../features/cart/domain/repository/cart_repository.dart';
import '../../features/cart/domain/usecase/add_to_cart_usecase.dart';
import '../../features/cart/domain/usecase/delete_from_cart_usecase.dart';
import '../../features/cart/domain/usecase/fetch_cart_usecase.dart';
import '../../features/cart/domain/usecase/update_to_cart_usecase.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/notification/data/repository/notification_repository_impl.dart';
import '../../features/notification/data/source/notification_remote_data_source.dart';
import '../../features/notification/domain/repository/notification_repository.dart';
import '../../features/notification/domain/usecase/fetch_notification_usecase.dart';
import '../../features/notification/presentation/cubit/notification_cubit.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future<void> notificationInjection() async {
  sl.registerLazySingleton<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSource(sl<DioClient>().dio));
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(
      notificationRemoteDataSource: sl<NotificationRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<FetchNotificationUsecase>(
      () => FetchNotificationUsecase(sl<NotificationRepository>()));
  sl.registerLazySingleton<NotificationCubit>(() => NotificationCubit(
        fetchNotificationUsecase: sl<FetchNotificationUsecase>(),
      ));
}