import 'package:equatable/equatable.dart';
class CartEntity extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  const CartEntity({
    required this.id,
    required this.product,
    required this.quantity,
  });
  @override
  List<Object?> get props => [id, product, quantity];
}
class Product extends Equatable {
  final String id;
  final String title;
  final int price;
  final int discount;
  final String category;
  final String image;
  final int stock;
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    required this.category,
    required this.image,
    required this.stock,
  });
  @override
  List<Object?> get props => [id, title, price, discount, category, image];
}