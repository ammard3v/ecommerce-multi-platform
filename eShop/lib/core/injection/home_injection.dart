import '../../features/products/data/repository/repository.dart';
import '../../features/products/domain/usecase/fetch_top_budget_products_usecase.dart';
import '../../features/products/domain/usecase/fetch_top_featured_products_usecase.dart';
import '../../features/products/domain/usecase/usecase.dart';
import '../../features/shop/cubits/featured_product_cubit.dart';
import '../../features/wishlist/data/repo/wishlist_repository_impl.dart';
import '../../features/wishlist/data/source/wishlist_remote_data_source.dart';
import '../../features/wishlist/domain/repo/wishlist_repository.dart';
import '../../features/wishlist/domain/usecase/add_to_wishlist_usecase.dart';
import '../../features/wishlist/domain/usecase/fetch_wishlist_usecase.dart';
import '../../features/wishlist/presentation/cubit/wishlist_cubit.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future homeInjection() async {
  sl.registerLazySingleton<FetchTopFeaturedProductsUsecase>(
      () => FetchTopFeaturedProductsUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<FetchTopBudgetProductsUsecase>(
      () => FetchTopBudgetProductsUsecase(sl<ProductRepository>()));
  sl.registerFactory(
    () => FeaturedProductCubit(
      fetchTopFeaturedProductsUsecase: sl(),
    ),
  );
}