import '../../features/wishlist/data/repo/wishlist_repository_impl.dart';
import '../../features/wishlist/data/source/wishlist_remote_data_source.dart';
import '../../features/wishlist/domain/repo/wishlist_repository.dart';
import '../../features/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../features/wishlist/domain/usecase/fetch_wishlist_usecase.dart';
import '../../features/wishlist/presentation/cubit/wishlist_cubit.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future<void> wishlistInjection() async {
  sl.registerLazySingleton<WishlistRemoteDataSource>(
      () => WishlistRemoteDataSource(sl<DioClient>().dio));
  sl.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(
      wishlistRemoteDataSource: sl<WishlistRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<FetchWishlistUsecase>(
      () => FetchWishlistUsecase(sl<WishlistRepository>()));
  sl.registerLazySingleton<AddToWishlistUsecase>(
      () => AddToWishlistUsecase(sl<WishlistRepository>()));
  sl.registerLazySingleton<WishlistCubit>(() => WishlistCubit(
        fetchWishlistUsecase: sl<FetchWishlistUsecase>(),
        addToWishlistUsecase: sl<AddToWishlistUsecase>(),
      ));
}