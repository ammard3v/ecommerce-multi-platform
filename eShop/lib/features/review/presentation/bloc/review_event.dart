part of 'review_bloc.dart';
abstract class ReviewEvent {}
class FetchProductReviewEvent extends ReviewEvent {
  final String productId;
  FetchProductReviewEvent({
    required this.productId,
  });
}
class WriteReviewEvent extends ReviewEvent {
  final String productId;
  final CreateReview createReview;
  WriteReviewEvent({
    required this.productId,
    required this.createReview,
  });
}
class FetchUserReviewsEvent extends ReviewEvent {
  FetchUserReviewsEvent();
}