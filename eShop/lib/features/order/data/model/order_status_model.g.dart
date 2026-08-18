part of 'order_status_model.dart';
_OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) =>
    _OrderStatusModel(
      itemId: json['itemId'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      status: json['status'] as String,
      statusIndex: (json['statusIndex'] as num).toInt(),
      group: json['group'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
Map<String, dynamic> _$OrderStatusModelToJson(_OrderStatusModel instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'product': instance.product,
      'status': instance.status,
      'statusIndex': instance.statusIndex,
      'group': instance.group,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      discountPrice: (json['discountPrice'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
    );
Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'images': instance.images,
      'id': instance.id,
    };
