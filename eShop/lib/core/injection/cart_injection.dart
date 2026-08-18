import '../../features/cart/data/repository/cart_repository_impl.dart';
import '../../features/cart/data/source/cart_remote_data_source.dart';
import '../../features/cart/domain/repository/cart_repository.dart';
import '../../features/cart/domain/usecase/add_to_cart_usecase.dart';
import '../../features/cart/domain/usecase/delete_from_cart_usecase.dart';
import '../../features/cart/domain/usecase/fetch_cart_usecase.dart';
import '../../features/cart/domain/usecase/update_to_cart_usecase.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future cartInjection() async {
  sl.registerFactory<CartBloc>(() => CartBloc(
        fetchCartUsecase: sl<FetchCartUsecase>(),
        addToCartUsecase: sl<AddToCartUsecase>(),
        updateToCartUsecase: sl<UpdateToCartUsecase>(),
        deleteFromCartUsecase: sl<DeleteFromCartUsecase>(),
      ));
  sl.registerLazySingleton<AddToCartUsecase>(
      () => AddToCartUsecase(sl<CartRepository>()));
  sl.registerLazySingleton<FetchCartUsecase>(
      () => FetchCartUsecase(sl<CartRepository>()));
  sl.registerLazySingleton<UpdateToCartUsecase>(
      () => UpdateToCartUsecase(sl<CartRepository>()));
  sl.registerLazySingleton<DeleteFromCartUsecase>(
      () => DeleteFromCartUsecase(sl<CartRepository>()));
  sl.registerLazySingleton<CartRepository>(() =>
      CartRepositoryImpl(cartRemoteDataSource: sl<CartRemoteDataSource>()));
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSource(sl<DioClient>().dio));
}