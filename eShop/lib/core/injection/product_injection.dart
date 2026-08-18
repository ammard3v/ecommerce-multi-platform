import '../network/dio_client.dart';
import '../../features/products/data/repository/product_repository_impl.dart';
import '../../features/products/data/source/product_remote_data_source.dart';
import '../../features/products/domain/repository/product_repository.dart';
import '../../features/products/domain/usecase/add_product_usecase.dart';
import '../../features/products/domain/usecase/delete_product_usecase.dart';
import '../../features/products/domain/usecase/fetch_product_by_category_usecase.dart';
import '../../features/products/domain/usecase/fetch_products_usecase.dart';
import '../../features/products/domain/usecase/fetch_single_product_usecase.dart';
import '../../features/products/domain/usecase/fetch_top_budget_products_usecase.dart';
import '../../features/products/domain/usecase/fetch_top_featured_products_usecase.dart';
import '../../features/products/presentation/bloc/product_bloc.dart';
import 'service_locater.dart';
Future productInjection() async {
  sl.registerLazySingleton<FetchProductsUsecase>(
      () => FetchProductsUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<FetchTopFeaturedProductsUsecase>(
      () => FetchTopFeaturedProductsUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<FetchTopBudgetProductsUsecase>(
      () => FetchTopBudgetProductsUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<FetchSingleProductUsecase>(
      () => FetchSingleProductUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<FetchProductByCategoryUsecase>(
      () => FetchProductByCategoryUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSource(sl<DioClient>().dio));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
      productRemoteDataSource: sl<ProductRemoteDataSource>()));
  sl.registerLazySingleton<ProductBloc>(() => ProductBloc(
        fetchProductsUsecase: sl<FetchProductsUsecase>(),
        fetchTopFeaturedProductsUsecase: sl<FetchTopFeaturedProductsUsecase>(),
        fetchSingleProductUsecase: sl<FetchSingleProductUsecase>(),
        fetchProductByCategoryUsecase: sl<FetchProductByCategoryUsecase>(),
      ));
}