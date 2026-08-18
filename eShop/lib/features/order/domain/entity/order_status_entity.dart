import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_status_entity.freezed.dart';
@freezed
abstract class OrderStatusEntity with _$OrderStatusEntity {
  const factory OrderStatusEntity({
    required String itemId,
    required ProductEntity product,
    required String status,
    required int statusIndex,
    required String group,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
  }) = _OrderStatusEntity;
}
@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String title,
    required int price,
    required int discountPrice,
    required List<String> images,
    required String id,
  }) = _ProductEntity;
}