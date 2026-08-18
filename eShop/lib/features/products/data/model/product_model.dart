import '../../../../core/routes/route_barel.dart';
import '../../../payment/data/source/payment_remote_data_source.dart';
import '../../domain/entity/meta_entity.dart';
class ProductModel extends ProductEntity {
  const ProductModel({
    required super.meta,
    required super.products,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'meta': meta,
      'products': products,
    };
  }
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel.fromJson(map);
  }
}
extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(meta: meta, products: products);
  }
}