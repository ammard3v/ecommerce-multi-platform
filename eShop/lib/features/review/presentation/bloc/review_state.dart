part of 'review_bloc.dart';
abstract class ReviewState {}
class ReviewInitialState extends ReviewState {}
class ReviewLoadingState extends ReviewState {}
class ReviewSuccessState extends ReviewState {}
class ReviewLoadedState extends ReviewState {
  final ReviewEntity review;
  ReviewLoadedState(this.review);
}
class UserReviewLoadedState extends ReviewState {
  final List<UserReviewEntity> review;
  UserReviewLoadedState(this.review);
}
class ReviewFailureState extends ReviewState {
  final String message;
  ReviewFailureState(this.message);
}