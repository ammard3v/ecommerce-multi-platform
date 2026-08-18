import '../../domain/entity/user_review_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_review_model.freezed.dart';
part 'user_review_model.g.dart';
@freezed
abstract class UserReviewModel with _$UserReviewModel {
  const factory UserReviewModel({
    required String review,
    required double rating,
    required String product,
    required String orderId,
    required String id,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
  }) = _UserReviewModel;
  factory UserReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UserReviewModelFromJson(json);
}
extension UserReviewModelX on UserReviewModel {
  UserReviewEntity toEntity() {
    return UserReviewEntity(
      review: review,
      rating: rating,
      product: product,
      orderId: orderId,
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
extension UserReviewModelListX on List<UserReviewModel> {
  List<UserReviewEntity> toEntityList() =>
      map((value) => value.toEntity()).toList();
}