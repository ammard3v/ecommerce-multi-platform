import '../../features/order/domain/usecase/fetch_paid_order_status_usecase.dart';
import 'service_locater.dart';
import '../network/dio_client.dart';
import '../../features/order/data/repository/order_repository_impl.dart';
import '../../features/order/data/source/order_remote_data_source.dart';
import '../../features/order/domain/repository/order_repository.dart';
import '../../features/order/domain/usecase/create_order_usecase.dart';
import '../../features/order/domain/usecase/fetch_order_status_usecase.dart';
import '../../features/order/domain/usecase/fetch_order_usecase.dart';
import '../../features/order/presentation/bloc/order_bloc.dart';
Future orderInjection() async {
  sl.registerLazySingleton<FetchOrderUsecase>(
      () => FetchOrderUsecase(sl<OrderRepository>()));
  sl.registerLazySingleton<FetchPaidOrderStatusUsecase>(
      () => FetchPaidOrderStatusUsecase(sl<OrderRepository>()));
  sl.registerLazySingleton<FetchOrderStatusUsecase>(
      () => FetchOrderStatusUsecase(sl<OrderRepository>()));
  sl.registerLazySingleton<CreateOrderUsecase>(
      () => CreateOrderUsecase(sl<OrderRepository>()));
  sl.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSource(sl<DioClient>().dio));
  sl.registerLazySingleton<OrderRepository>(() =>
      OrderRepositoryImpl(orderRemoteDataSource: sl<OrderRemoteDataSource>()));
  sl.registerFactory<OrderBloc>(() => OrderBloc(
        fetchOrderUsecase: sl<FetchOrderUsecase>(),
        fetchPaidOrderStatusUsecase: sl<FetchPaidOrderStatusUsecase>(),
        fetchOrderStatusUsecase: sl<FetchOrderStatusUsecase>(),
        createOrderUsecase: sl<CreateOrderUsecase>(),
      ));
}