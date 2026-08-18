part of 'order_model.dart';
_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
      paymentResult: json['paymentResult'] == null
          ? null
          : PaymentResultModel.fromJson(
              json['paymentResult'] as Map<String, dynamic>),
      userInfo:
          UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingAddress: ShippingAddressModel.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
      itemsPrice: (json['itemsPrice'] as num).toDouble(),
      shippingPrice: (json['shippingPrice'] as num).toDouble(),
      taxPrice: (json['taxPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'] as String,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      hasReviewed: json['hasReviewed'] as bool?,
      canReview: json['canReview'] as bool?,
      shippedAt: json['shippedAt'] == null
          ? null
          : DateTime.parse(json['shippedAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
    );
Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'paymentResult': instance.paymentResult,
      'userInfo': instance.userInfo,
      'orderItems': instance.orderItems,
      'shippingAddress': instance.shippingAddress,
      'itemsPrice': instance.itemsPrice,
      'shippingPrice': instance.shippingPrice,
      'taxPrice': instance.taxPrice,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'hasReviewed': instance.hasReviewed,
      'canReview': instance.canReview,
      'shippedAt': instance.shippedAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
    };
_UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    _UserInfoModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      id: json['_id'] as String,
    );
Map<String, dynamic> _$UserInfoModelToJson(_UserInfoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      '_id': instance.id,
    };
_PaymentResultModel _$PaymentResultModelFromJson(Map<String, dynamic> json) =>
    _PaymentResultModel(
      id: json['id'] as String,
      status: json['status'] as String,
    );
Map<String, dynamic> _$PaymentResultModelToJson(_PaymentResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };
_OrderItemsModel _$OrderItemsModelFromJson(Map<String, dynamic> json) =>
    _OrderItemsModel(
      product: json['product'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      image: json['image'] as String,
      id: json['_id'] as String,
    );
Map<String, dynamic> _$OrderItemsModelToJson(_OrderItemsModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'image': instance.image,
      '_id': instance.id,
    };
_ShippingAddressModel _$ShippingAddressModelFromJson(
        Map<String, dynamic> json) =>
    _ShippingAddressModel(
      addressLine1: json['address_line1'] as String,
      addressLine2: json['address_line2'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postal_code'] as String,
      country: json['country'] as String?,
      optionalRemarks: json['optional_remarks'] as String?,
      isDefault: json['is_default'] as bool?,
      id: json['_id'] as String,
    );
Map<String, dynamic> _$ShippingAddressModelToJson(
        _ShippingAddressModel instance) =>
    <String, dynamic>{
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'country': instance.country,
      'optional_remarks': instance.optionalRemarks,
      'is_default': instance.isDefault,
      '_id': instance.id,
    };
