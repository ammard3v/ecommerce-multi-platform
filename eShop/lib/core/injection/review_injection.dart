import '../../features/review/domain/usecase/fetch_user_review_usecase.dart';
import '../../features/review/domain/usecase/write_review_usecase.dart';
import '../../features/review/data/repository/review_repository_impl.dart';
import '../../features/review/data/source/review_remote_data_source.dart';
import '../../features/review/domain/repository/review_repository.dart';
import '../../features/review/domain/usecase/product_review_usecase.dart';
import '../../features/review/presentation/bloc/review_bloc.dart';
import '../network/dio_client.dart';
import 'service_locater.dart';
Future reviewInjection() async {
  sl.registerLazySingleton<ProductReviewUsecase>(
      () => ProductReviewUsecase(sl<ReviewRepository>()));
  sl.registerLazySingleton<WriteReviewUsecase>(
      () => WriteReviewUsecase(sl<ReviewRepository>()));
  sl.registerLazySingleton<FetchUserReviewUsecase>(
      () => FetchUserReviewUsecase(sl<ReviewRepository>()));
  sl.registerLazySingleton<ReviewRemoteDataSource>(
      () => ReviewRemoteDataSource(sl<DioClient>().dio));
  sl.registerLazySingleton<ReviewRepository>(
      () => ReviewRepositoryImpl(reviewRemoteDataSource: sl()));
  sl.registerFactory<ReviewBloc>(() => ReviewBloc(
        productReviewUsecase: sl<ProductReviewUsecase>(),
        fetchUserReviewUsecase: sl<FetchUserReviewUsecase>(),
        writeReviewUsecase: sl<WriteReviewUsecase>(),
      ));
}