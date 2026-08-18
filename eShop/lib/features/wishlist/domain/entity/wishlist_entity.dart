import 'dart:convert';
import 'package:equatable/equatable.dart';
class WishlistEntity extends Equatable {
  final String id;
  final String title;
  final int price;
  final int discount;
  final int stock;
  final String index0Image;
  final String category;
  final num ratingAvg;
  const WishlistEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    required this.stock,
    required this.index0Image,
    required this.category,
    required this.ratingAvg,
  });
  @override
  List<Object?> get props =>
      [id, title, price, discount, stock, index0Image, category, ratingAvg];
}