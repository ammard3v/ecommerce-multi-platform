part of 'user_review_model.dart';
_UserReviewModel _$UserReviewModelFromJson(Map<String, dynamic> json) =>
    _UserReviewModel(
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
      product: json['product'] as String,
      orderId: json['orderId'] as String,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
Map<String, dynamic> _$UserReviewModelToJson(_UserReviewModel instance) =>
    <String, dynamic>{
      'review': instance.review,
      'rating': instance.rating,
      'product': instance.product,
      'orderId': instance.orderId,
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
