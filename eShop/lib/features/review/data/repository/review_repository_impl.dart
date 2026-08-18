import 'package:eshop/features/review/data/model/create_review.dart';
import 'package:eshop/features/review/data/model/user_review_model.dart';
import 'package:eshop/features/review/domain/entity/user_review_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:eshop/core/error/failures.dart';
import 'package:eshop/features/cart/data/source/source.dart';
import 'package:eshop/features/review/data/model/review_model.dart';
import 'package:eshop/features/review/data/source/review_remote_data_source.dart';
import 'package:eshop/features/review/domain/entity/review_entity.dart';
import 'package:eshop/features/review/domain/repository/review_repository.dart';
class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource reviewRemoteDataSource;
  ReviewRepositoryImpl({
    required this.reviewRemoteDataSource,
  });
  @override
  ResultFuture<ReviewEntity> fetchReviewForProduct(String id) async {
    try {
      final response = await reviewRemoteDataSource.fetchReviewForProduct(id);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<List<UserReviewEntity>> fetchUserReviews() async {
    try {
      final response = await reviewRemoteDataSource.fetchUserReviews();
      return Right(response.data.toEntityList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<UserReviewEntity> writeReview(
      {required String productId, required CreateReview createReview}) async {
    try {
      final response =
          await reviewRemoteDataSource.writeReview(productId, createReview);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}