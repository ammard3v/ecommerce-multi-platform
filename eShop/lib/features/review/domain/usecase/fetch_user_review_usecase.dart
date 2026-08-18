import 'package:eshop/core/usecase/typedef.dart';
import 'package:eshop/core/usecase/usecase.dart';
import 'package:eshop/features/review/domain/entity/user_review_entity.dart';
import 'package:eshop/features/review/domain/repository/review_repository.dart';
class FetchUserReviewUsecase
    implements UseCaseWithoutParams<List<UserReviewEntity>> {
  final ReviewRepository reviewRepository;
  FetchUserReviewUsecase(this.reviewRepository);
  @override
  ResultFuture<List<UserReviewEntity>> call() async {
    return await reviewRepository.fetchUserReviews();
  }
}