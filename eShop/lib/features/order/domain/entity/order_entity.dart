import 'package:equatable/equatable.dart';
class OrderEntity extends Equatable {
  final PaymentResultEntity? paymentResult;
  final UserInfoEntity userInfo;
  final List<OrderItemsEntity> orderItems;
  final ShippingAddressEntity shippingAddress;
  final double itemsPrice;
  final double shippingPrice;
  final double taxPrice;
  final double totalPrice;
  final String status;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool hasReviewed;
  final bool canReview;
  final DateTime? shippedAt;
  final DateTime? deliveredAt;
  const OrderEntity({
    this.paymentResult,
    required this.userInfo,
    required this.orderItems,
    required this.shippingAddress,
    required this.itemsPrice,
    required this.shippingPrice,
    required this.taxPrice,
    required this.totalPrice,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.hasReviewed,
    required this.canReview,
    this.shippedAt,
    this.deliveredAt,
  });
  @override
  List<Object?> get props => [
        paymentResult,
        userInfo,
        orderItems,
        shippingAddress,
        itemsPrice,
        shippingPrice,
        taxPrice,
        totalPrice,
        status,
        id,
        createdAt,
        updatedAt,
        hasReviewed,
        canReview,
      ];
}
class UserInfoEntity extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String phone;
  final String id;
  const UserInfoEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
  });
  @override
  List<Object?> get props => [userId, name, email, phone, id];
}
class PaymentResultEntity extends Equatable {
  final String id;
  final String status;
  const PaymentResultEntity({
    required this.id,
    required this.status,
  });
  @override
  List<Object?> get props => [id, status];
}
class OrderItemsEntity extends Equatable {
  final String product;
  final String title;
  final double price;
  final int quantity;
  final String image;
  final String id;
  const OrderItemsEntity({
    required this.product,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
    required this.id,
  });
  @override
  List<Object?> get props => [product, title, price, quantity, image, id];
}
class ShippingAddressEntity extends Equatable {
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String optionalRemarks;
  final bool isDefault;
  final String id;
  const ShippingAddressEntity({
    required this.addressLine1,
    this.addressLine2 = "",
    required this.city,
    required this.state,
    required this.postalCode,
    this.country = "Nepal",
    this.optionalRemarks = "",
    this.isDefault = false,
    required this.id,
  });
  @override
  List<Object?> get props => [
        addressLine1,
        addressLine2,
        city,
        state,
        postalCode,
        country,
        optionalRemarks,
        isDefault,
        id
      ];
}