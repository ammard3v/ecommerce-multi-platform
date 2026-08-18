part of 'review_model.dart';
_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
      reviewCount: (json['reviewCount'] as num).toInt(),
      averageReview: (json['averageReview'] as num).toDouble(),
      ratingsMap: (json['ratingsMap'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'reviewCount': instance.reviewCount,
      'averageReview': instance.averageReview,
      'ratingsMap': instance.ratingsMap,
      'reviews': instance.reviews,
    };
_ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) =>
    _ReviewsModel(
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
      product: json['product'] as String,
      userId: ReviewUserModel.fromJson(json['userId'] as Map<String, dynamic>),
      orderId: json['orderId'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      id: json['id'] as String,
      verifiedPurchase: json['verifiedPurchase'] as bool,
    );
Map<String, dynamic> _$ReviewsModelToJson(_ReviewsModel instance) =>
    <String, dynamic>{
      'review': instance.review,
      'rating': instance.rating,
      'product': instance.product,
      'userId': instance.userId,
      'orderId': instance.orderId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'verifiedPurchase': instance.verifiedPurchase,
    };
_ReviewUserModel _$ReviewUserModelFromJson(Map<String, dynamic> json) =>
    _ReviewUserModel(
      name: json['name'] as String,
      id: json['id'] as String,
    );
Map<String, dynamic> _$ReviewUserModelToJson(_ReviewUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
