import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/review_entity.dart';
part 'review_model.freezed.dart';
part 'review_model.g.dart';
@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required int reviewCount,
    required double averageReview,
    required List<double> ratingsMap,
    required List<ReviewsModel> reviews,
  }) = _ReviewModel;
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
@freezed
abstract class ReviewsModel with _$ReviewsModel {
  const factory ReviewsModel({
    required String review,
    required double rating,
    required String product,
    required ReviewUserModel userId,
    required String orderId,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    required String id,
    required bool verifiedPurchase,
  }) = _ReviewsModel;
  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);
}
@freezed
abstract class ReviewUserModel with _$ReviewUserModel {
  const factory ReviewUserModel({
    required String name,
    required String id,
  }) = _ReviewUserModel;
  factory ReviewUserModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserModelFromJson(json);
}
extension ReviewModelX on ReviewModel {
  ReviewEntity toEntity() {
    return ReviewEntity(
      reviewCount: reviewCount,
      averageReview: averageReview,
      ratingsMap: ratingsMap,
      reviews: reviews.map((r) => r.toEntity()).toList(),
    );
  }
}
extension ReviewsModelX on ReviewsModel {
  ReviewsEntity toEntity() {
    return ReviewsEntity(
      review: review,
      rating: rating,
      product: product,
      userId: userId.toEntity(),
      orderId: orderId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
      verifiedPurchase: verifiedPurchase,
    );
  }
}
extension ReviewUserModelX on ReviewUserModel {
  ReviewUserEntity toEntity() {
    return ReviewUserEntity(
      name: name,
      id: id,
    );
  }
}