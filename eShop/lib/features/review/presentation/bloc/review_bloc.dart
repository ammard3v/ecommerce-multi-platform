import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import '../../../cart/domain/usecase/usecase.dart';
import '../../data/model/create_review.dart';
import '../../domain/entity/user_review_entity.dart';
import '../../domain/usecase/fetch_user_review_usecase.dart';
import '../../domain/usecase/write_review_usecase.dart';
import '../../domain/entity/review_entity.dart';
import '../../domain/usecase/product_review_usecase.dart';
part 'review_event.dart';
part 'review_state.dart';
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ProductReviewUsecase _productReviewUsecase;
  final FetchUserReviewUsecase _fetchUserReviewUsecase;
  final WriteReviewUsecase _writeReviewUsecase;
  List<UserReviewEntity> _userReviews = [];
  ReviewBloc({
    required ProductReviewUsecase productReviewUsecase,
    required FetchUserReviewUsecase fetchUserReviewUsecase,
    required WriteReviewUsecase writeReviewUsecase,
  })  : _productReviewUsecase = productReviewUsecase,
        _fetchUserReviewUsecase = fetchUserReviewUsecase,
        _writeReviewUsecase = writeReviewUsecase,
        super(ReviewInitialState()) {
    on<FetchProductReviewEvent>(_onFetchReview);
    on<WriteReviewEvent>(_onWriteReviewEvent);
    on<FetchUserReviewsEvent>(_onFetchUserReviewsEvent);
  }
  Future<void> _onFetchReview(
    FetchProductReviewEvent event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewLoadingState());
    final result = await _productReviewUsecase.call(event.productId);
    result.fold(
      (failure) => emit(ReviewFailureState(failure.message)),
      (response) => emit(ReviewLoadedState(response)),
    );
  }
  Future<void> _onFetchUserReviewsEvent(
    FetchUserReviewsEvent event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewLoadingState());
    final result = await _fetchUserReviewUsecase.call();
    result.fold(
      (failure) => emit(ReviewFailureState(failure.message)),
      (response) {
        _userReviews = response;
        emit(UserReviewLoadedState(_userReviews));
      },
    );
  }
  Future<void> _onWriteReviewEvent(
    WriteReviewEvent event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewLoadingState());
    final result = await _writeReviewUsecase.call(
      WriteReviewParams(
        productId: event.productId,
        createReview: event.createReview,
      ),
    );
    result.fold(
      (failure) => emit(ReviewFailureState(failure.message)),
      (newReview) {
        _userReviews.insert(0, newReview);
        emit(UserReviewLoadedState(List.from(_userReviews)));
      },
    );
  }
}