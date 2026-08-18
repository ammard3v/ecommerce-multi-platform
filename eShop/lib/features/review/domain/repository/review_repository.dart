import '../../data/model/create_review.dart';
import '../entity/user_review_entity.dart';
import '../../../../core/usecase/typedef.dart';
import '../entity/review_entity.dart';
abstract class ReviewRepository {
  ResultFuture<ReviewEntity> fetchReviewForProduct(String id);
  ResultFuture<List<UserReviewEntity>> fetchUserReviews();
  ResultFuture<UserReviewEntity> writeReview({
    required String productId,
    required CreateReview createReview,
  });
}