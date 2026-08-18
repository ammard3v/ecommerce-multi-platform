import '../../domain/entity/meta_entity.dart';
class ProductMetaModel extends ProductMetaEntity {
  const ProductMetaModel({
    required super.page,
    required super.limit,
    required super.totalCount,
    required super.totalPages,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'page': page,
      'limit': limit,
      'total_count': totalCount,
      'total_pages': totalPages,
    };
  }
  factory ProductMetaModel.fromJson(Map<String, dynamic> map) {
    return ProductMetaModel(
      page: map['page'] as int,
      limit: map['limit'] as int,
      totalCount: map['total_count'] as int,
      totalPages: map['total_pages'] as int,
    );
  }
}
extension ProductMetaModelX on ProductMetaModel {
  ProductMetaEntity toEntity() {
    return ProductMetaEntity(
      limit: limit,
      page: page,
      totalCount: totalCount,
      totalPages: totalPages,
    );
  }
}