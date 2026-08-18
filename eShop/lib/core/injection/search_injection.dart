import '../network/dio_client.dart';
import '../../features/search/data/repository/search_repository_impl.dart';
import '../../features/search/data/source/search_local_data_source.dart';
import '../../features/search/data/source/search_remote_data_source.dart';
import '../../features/search/domain/repository/search_repository.dart';
import '../../features/search/domain/usecase/fetch_search_product_usecase.dart';
import '../../features/search/domain/usecase/fetch_sort_products_usecase.dart';
import '../../features/search/domain/usecase/get_saved_search_usecase.dart';
import '../../features/search/domain/usecase/remove_all_search_usecase.dart';
import '../../features/search/domain/usecase/remove_specific_text_usecase.dart';
import '../../features/search/domain/usecase/save_search_text_usecase.dart';
import '../../features/search/presentation/cubit/search_product_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service_locater.dart';
Future searchInjection() async {
  sl.registerLazySingleton<FetchSearchProductUsecase>(
      () => FetchSearchProductUsecase(sl<SearchRepository>()));
  sl.registerLazySingleton<FetchSortProductsUsecase>(
      () => FetchSortProductsUsecase(sl<SearchRepository>()));
  sl.registerLazySingleton<GetSavedSearchUsecase>(
      () => GetSavedSearchUsecase(sl<SearchRepository>()));
  sl.registerLazySingleton<SaveSearchTextUsecase>(
      () => SaveSearchTextUsecase(sl<SearchRepository>()));
  sl.registerLazySingleton<RemoveSpecificTextUsecase>(
      () => RemoveSpecificTextUsecase(sl<SearchRepository>()));
  sl.registerLazySingleton<RemoveAllSearchUsecase>(
      () => RemoveAllSearchUsecase(searchRepository: sl()));
  sl.registerLazySingleton<SearchLocalDataSource>(
      () => SearchLocalDataSourceImpl(prefs: sl<SharedPreferences>()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSource(sl<DioClient>().dio));
  sl.registerLazySingleton(
    () => SearchProductCubit(
      fetchSearchProductUsecase: sl(),
      fetchSortProductsUsecase: sl(),
      getSavedSearchUsecase: sl(),
      saveSearchTextUsecase: sl(),
      removeSpecificTextUsecase: sl(),
      removeAllSearchUsecase: sl(),
    ),
  );
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(
      searchRemoteDataSource: sl<SearchRemoteDataSource>(),
      searchLocalDataSource: sl<SearchLocalDataSource>()));
}