import 'package:eshop/core/usecase/typedef.dart';
import 'package:eshop/core/usecase/usecase.dart';
import 'package:eshop/features/review/data/model/create_review.dart';
import 'package:eshop/features/review/domain/entity/user_review_entity.dart';
import 'package:eshop/features/review/domain/repository/review_repository.dart';
class WriteReviewUsecase
    implements UseCase<UserReviewEntity, WriteReviewParams> {
  final ReviewRepository reviewRepository;
  const WriteReviewUsecase(this.reviewRepository);
  @override
  ResultFuture<UserReviewEntity> call(WriteReviewParams params) async {
    return await reviewRepository.writeReview(
        createReview: params.createReview, productId: params.productId);
  }
}
class WriteReviewParams {
  final String productId;
  final CreateReview createReview;
  const WriteReviewParams({
    required this.productId,
    required this.createReview,
  });
}