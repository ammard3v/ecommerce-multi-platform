import '../../features/category/data/repository/category_repository_impl.dart';
import '../../features/category/data/source/category_remote_data_source.dart';
import '../../features/category/domain/repository/category_repository.dart';
import '../../features/category/domain/usecase/create_category_usecase.dart';
import '../../features/category/domain/usecase/delete_category_usecase.dart';
import '../../features/category/domain/usecase/fetch_all_category_usecase.dart';
import '../../features/category/domain/usecase/fetch_one_category_usecase.dart';
import '../../features/category/domain/usecase/update_category_usecase.dart';
import '../../features/category/presentation/bloc/category_bloc.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future categoryInjection() async {
  sl.registerLazySingleton<FetchAllCategoryUsecase>(
      () => FetchAllCategoryUsecase(sl<CategoryRepository>()));
  sl.registerLazySingleton<FetchOneCategoryUsecase>(
      () => FetchOneCategoryUsecase(sl<CategoryRepository>()));
  sl.registerLazySingleton<CreateCategoryUsecase>(
      () => CreateCategoryUsecase(sl<CategoryRepository>()));
  sl.registerLazySingleton<UpdateCategoryUsecase>(
      () => UpdateCategoryUsecase(sl<CategoryRepository>()));
  sl.registerLazySingleton<DeleteCategoryUsecase>(
      () => DeleteCategoryUsecase(sl<CategoryRepository>()));
  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSource(sl<DioClient>().dio));
  sl.registerFactory<CategoryBloc>(() => CategoryBloc(
        fetchAllCategoryUsecase: sl<FetchAllCategoryUsecase>(),
        fetchOneCategoryUsecase: sl<FetchOneCategoryUsecase>(),
        createCategoryUsecase: sl<CreateCategoryUsecase>(),
        updateCategoryUsecase: sl<UpdateCategoryUsecase>(),
        deleteCategoryUsecase: sl<DeleteCategoryUsecase>(),
      ));
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
      categoryRemoteDataSource: sl<CategoryRemoteDataSource>()));
}