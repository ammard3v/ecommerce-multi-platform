import 'dart:convert';
class CreateReview {
  final String review;
  final double rating;
  final String orderId;
  CreateReview({
    required this.review,
    required this.rating,
    required this.orderId,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'review': review,
      'rating': rating,
      "orderId": orderId,
    };
  }
}