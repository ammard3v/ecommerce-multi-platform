import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/order_status_entity.dart';
part 'order_status_model.freezed.dart';
part 'order_status_model.g.dart';
@freezed
abstract class OrderStatusModel with _$OrderStatusModel {
  const factory OrderStatusModel({
    required String itemId,
    required ProductModel product,
    required String status,
    required int statusIndex,
    required String group,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
  }) = _OrderStatusModel;
  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusModelFromJson(json);
}
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String title,
    required int price,
    required int discountPrice,
    required List<String> images,
    required String id,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
extension OrderStatusModelX on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      itemId: itemId,
      product: product.toEntity(),
      status: status,
      statusIndex: statusIndex,
      group: group,
      updatedAt: updatedAt,
    );
  }
}
extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      title: title,
      price: price,
      discountPrice: discountPrice,
      images: images,
      id: id,
    );
  }
}