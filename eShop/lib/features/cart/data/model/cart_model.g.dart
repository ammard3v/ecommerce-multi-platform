part of 'cart_model.dart';
_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
      id: json['id'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );
Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
    };
_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      category: json['category'] as String,
      image: json['image'] as String,
      stock: (json['stock'] as num).toInt(),
    );
Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'discount': instance.discount,
      'category': instance.category,
      'image': instance.image,
      'stock': instance.stock,
    };
