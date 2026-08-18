import 'package:eshop/core/usecase/typedef.dart';
import 'package:eshop/core/usecase/usecase.dart';
import 'package:eshop/features/review/domain/entity/review_entity.dart';
import 'package:eshop/features/review/domain/repository/review_repository.dart';
class ProductReviewUsecase implements UseCase<ReviewEntity, String> {
  final ReviewRepository reviewRepository;
  const ProductReviewUsecase(this.reviewRepository);
  @override
  ResultFuture<ReviewEntity> call(String params) async {
    return await reviewRepository.fetchReviewForProduct(params);
  }
}