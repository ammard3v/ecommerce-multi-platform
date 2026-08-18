import '../../domain/entity/wishlist_entity.dart';
class WishlistModel extends WishlistEntity {
  const WishlistModel({
    required super.id,
    required super.title,
    required super.price,
    required super.discount,
    required super.stock,
    required super.index0Image,
    required super.category,
    required super.ratingAvg,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'discount': discount,
      'stock': stock,
      'index0Image': index0Image,
      'category': category,
      'rating_avg': ratingAvg,
    };
  }
  factory WishlistModel.fromJson(Map<String, dynamic> map) {
    return WishlistModel(
      id: map['id'] as String,
      title: map['title'] as String,
      price: map['price'] as int,
      discount: map['discount'] as int,
      stock: map['stock'] as int,
      index0Image: map['index0Image'] as String,
      category: map['category'] as String,
      ratingAvg: map['rating_avg'] as num,
    );
  }
}
extension WishlistModelX on WishlistModel {
  WishlistEntity toEntity() {
    return WishlistEntity(
      id: id,
      title: title,
      price: price,
      discount: discount,
      stock: stock,
      index0Image: index0Image,
      category: category,
      ratingAvg: ratingAvg,
    );
  }
}
extension WishlistModelListX on List<WishlistModel> {
  List<WishlistEntity> toEntityList() =>
      map((value) => value.toEntity()).toList();
}