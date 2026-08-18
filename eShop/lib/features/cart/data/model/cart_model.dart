import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entity/cart_entity.dart';
part 'cart_model.freezed.dart';
part 'cart_model.g.dart';
@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    required String id,
    required ProductModel product,
    required int quantity,
  }) = _CartModel;
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String title,
    required int price,
    required int discount,
    required String category,
    required String image,
    required int stock,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
extension ProductModelX on ProductModel {
  Product toEntity() {
    return Product(
      id: id,
      title: title,
      price: price,
      discount: discount,
      category: category,
      image: image,
      stock: stock,
    );
  }
}
extension CartModelX on CartModel {
  CartEntity toEntity() {
    return CartEntity(
      id: id,
      product: product.toEntity(),
      quantity: quantity,
    );
  }
}
extension CartEntityListX on List<CartEntity> {
  double get subTotal => double.parse(
        fold(0.0, (sum, item) => sum + item.product.price).toStringAsFixed(2),
      );
  double get totalDiscountAmount => double.parse(
        fold(
          0.0,
          (sum, item) =>
              sum +
              (item.product.price * item.product.discount / 100) *
                  item.quantity,
        ).toStringAsFixed(2),
      );
  int get totalQuantity => fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice => double.parse(
        fold(
          0.0,
          (sum, item) =>
              sum +
              (item.product.price * (1 - item.product.discount / 100)) *
                  item.quantity,
        ).toStringAsFixed(2),
      );
}
extension CartModelListX on List<CartModel> {
  List<CartEntity> toEntityList() => map((value) => value.toEntity()).toList();
}