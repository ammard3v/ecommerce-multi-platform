import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/order_entity.dart';
part 'order_model.freezed.dart';
part 'order_model.g.dart';
@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    PaymentResultModel? paymentResult, 
    required UserInfoModel userInfo,
    required List<OrderItemsModel> orderItems,
    required ShippingAddressModel shippingAddress,
    required double itemsPrice,
    required double shippingPrice,
    required double taxPrice,
    required double totalPrice,
    required String status,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    bool? hasReviewed,
    bool? canReview,
    DateTime? shippedAt,
    DateTime? deliveredAt,
  }) = _OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
@freezed
abstract class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    required String userId,
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: '_id') required String id,
  }) = _UserInfoModel;
  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
@freezed
abstract class PaymentResultModel with _$PaymentResultModel {
  const factory PaymentResultModel({
    required String id,
    required String status,
  }) = _PaymentResultModel;
  factory PaymentResultModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResultModelFromJson(json);
}
@freezed
abstract class OrderItemsModel with _$OrderItemsModel {
  const factory OrderItemsModel({
    required String product,
    required String title,
    required double price,
    required int quantity,
    required String image,
    @JsonKey(name: '_id') required String id,
  }) = _OrderItemsModel;
  factory OrderItemsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsModelFromJson(json);
}
@freezed
abstract class ShippingAddressModel with _$ShippingAddressModel {
  const factory ShippingAddressModel({
    @JsonKey(name: 'address_line1') required String addressLine1,
    @JsonKey(name: 'address_line2') String? addressLine2,
    required String city,
    required String state,
    @JsonKey(name: 'postal_code') required String postalCode,
    String? country,
    @JsonKey(name: 'optional_remarks') String? optionalRemarks,
    @JsonKey(name: 'is_default') bool? isDefault,
    @JsonKey(name: '_id') required String id,
  }) = _ShippingAddressModel;
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);
}
extension OrderModelMapper on OrderModel {
  OrderEntity toEntity() => OrderEntity(
        deliveredAt: deliveredAt,
        shippedAt: shippedAt,
        paymentResult: paymentResult?.toEntity(),
        userInfo: userInfo.toEntity(),
        orderItems: orderItems.toEntityList(),
        shippingAddress: shippingAddress.toEntity(),
        itemsPrice: itemsPrice,
        shippingPrice: shippingPrice,
        taxPrice: taxPrice,
        totalPrice: totalPrice,
        status: status,
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        hasReviewed: hasReviewed ?? false,
        canReview: canReview ?? true,
      );
}
extension UserInfoModelMapper on UserInfoModel {
  UserInfoEntity toEntity() => UserInfoEntity(
        userId: userId,
        name: name,
        email: email,
        phone: phone,
        id: id,
      );
}
extension PaymentResultModelMapper on PaymentResultModel {
  PaymentResultEntity toEntity() => PaymentResultEntity(
        id: id,
        status: status,
      );
}
extension OrderItemsModelMapper on OrderItemsModel {
  OrderItemsEntity toEntity() => OrderItemsEntity(
        product: product,
        title: title,
        price: price,
        quantity: quantity,
        image: image,
        id: id,
      );
}
extension ShippingAddressModelMapper on ShippingAddressModel {
  ShippingAddressEntity toEntity() => ShippingAddressEntity(
        addressLine1: addressLine1,
        addressLine2: addressLine2 ?? "",
        city: city,
        state: state,
        postalCode: postalCode,
        country: country ?? "Nepal",
        optionalRemarks: optionalRemarks ?? "",
        isDefault: isDefault ?? false,
        id: id,
      );
}
extension OrderModelListMapper on List<OrderModel> {
  List<OrderEntity> toEntityList() => map((e) => e.toEntity()).toList();
}
extension OrderItemsModelListMapper on List<OrderItemsModel> {
  List<OrderItemsEntity> toEntityList() => map((e) => e.toEntity()).toList();
}