part of 'single_product_model.dart';
_SingleProductModel _$SingleProductModelFromJson(Map<String, dynamic> json) =>
    _SingleProductModel(
      ratings:
          SingleRatingModel.fromJson(json['ratings'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      stock: (json['stock'] as num).toInt(),
      unitsSold: (json['units_sold'] as num).toInt(),
      isFeatured: json['is_featured'] as bool,
      category: SingleCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
      slug: json['slug'] as String,
      index0Image: json['index0Image'] as String,
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
Map<String, dynamic> _$SingleProductModelToJson(_SingleProductModel instance) =>
    <String, dynamic>{
      'ratings': instance.ratings,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'images': instance.images,
      'stock': instance.stock,
      'units_sold': instance.unitsSold,
      'is_featured': instance.isFeatured,
      'category': instance.category,
      'slug': instance.slug,
      'index0Image': instance.index0Image,
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
_SingleCategoryModel _$SingleCategoryModelFromJson(Map<String, dynamic> json) =>
    _SingleCategoryModel(
      id: json['id'] as String,
      title: json['title'] as String,
    );
Map<String, dynamic> _$SingleCategoryModelToJson(
        _SingleCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
_SingleRatingModel _$SingleRatingModelFromJson(Map<String, dynamic> json) =>
    _SingleRatingModel(
      average: (json['average'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
    );
Map<String, dynamic> _$SingleRatingModelToJson(_SingleRatingModel instance) =>
    <String, dynamic>{
      'average': instance.average,
      'quantity': instance.quantity,
    };
