import 'dart:convert';
class StripePaymentReq {
  final List<CartItem> orderItems;
  final BillingAddress billingAddress;
  StripePaymentReq({
    required this.orderItems,
    required this.billingAddress,
  });
  Map<String, dynamic> toJson() {
    return {
      'cartItems': orderItems.map((item) => item.toJson()).toList(),
      'shippingAddress': billingAddress.toJson(),
    };
  }
}
class CartItem {
  final Product product;
  final int quantity;
  CartItem({
    required this.product,
    required this.quantity,
  });
  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
class Product {
  String id;
  String name;
  Product({
    required this.id,
    required this.name,
  });
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
class BillingAddress {
  final String fullName;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String phone;
  final String email;
  BillingAddress({
    required this.fullName,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.phone,
    required this.email,
  });
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'phone': phone,
      'email': email,
    };
  }
}