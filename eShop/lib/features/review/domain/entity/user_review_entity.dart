import 'package:equatable/equatable.dart';
class UserReviewEntity extends Equatable {
  final String review;
  final double rating;
  final String product;
  final String orderId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserReviewEntity({
    required this.review,
    required this.rating,
    required this.product,
    required this.orderId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  List<Object?> get props => [
        review,
        rating,
        product,
        orderId,
        id,
        createdAt,
        updatedAt,
      ];
}