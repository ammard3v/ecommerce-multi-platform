import 'package:equatable/equatable.dart';
class SingleProductEntity extends Equatable {
  final SingleRatingEntity ratings;
  final String title;
  final String description;
  final int price;
  final int discount;
  final List<String> images;
  final int stock;
  final int unitsSold;
  final bool isFeatured;
  final SingleCategoryEntity category;
  final String slug;
  final String index0Image;
  final String id;
  final String createdAt;
  final String updatedAt;
  const SingleProductEntity({
    required this.ratings,
    required this.title,
    required this.description,
    required this.price,
    required this.discount,
    required this.images,
    required this.stock,
    required this.unitsSold,
    required this.isFeatured,
    required this.category,
    required this.slug,
    required this.index0Image,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  List<Object?> get props => [
        ratings,
        title,
        description,
        price,
        discount,
        images,
        stock,
        unitsSold,
        isFeatured,
        category,
        slug,
        index0Image,
        id,
        createdAt,
        updatedAt
      ];
}
class SingleRatingEntity extends Equatable {
  final double average;
  final int quantity;
  const SingleRatingEntity({
    required this.average,
    required this.quantity,
  });
  @override
  List<Object?> get props => [average, quantity];
}
class SingleCategoryEntity extends Equatable {
  final String title;
  final String id;
  const SingleCategoryEntity({
    required this.title,
    required this.id,
  });
  @override
  List<Object?> get props => [title, id];
}