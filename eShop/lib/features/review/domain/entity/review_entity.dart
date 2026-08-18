import 'package:freezed_annotation/freezed_annotation.dart';
part 'review_entity.freezed.dart';
@freezed
abstract class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required int reviewCount,
    required double averageReview,
    required List<double> ratingsMap,
    required List<ReviewsEntity> reviews,
  }) = _ReviewEntity;
}
@freezed
abstract class ReviewsEntity with _$ReviewsEntity {
  const factory ReviewsEntity({
    required String review,
    required double rating,
    required String product,
    required ReviewUserEntity userId,
    required String orderId,
    required String id,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    required bool verifiedPurchase,
  }) = _ReviewsEntity;
}
@freezed
abstract class ReviewUserEntity with _$ReviewUserEntity {
  const factory ReviewUserEntity({
    required String name,
    required String id,
  }) = _ReviewUserEntity;
}