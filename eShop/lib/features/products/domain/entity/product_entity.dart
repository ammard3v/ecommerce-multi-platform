import 'dart:convert';
import 'package:eshop/features/category/domain/usecase/usecase.dart';
import 'package:eshop/features/products/data/model/meta_model.dart';
import 'package:eshop/features/products/data/source/source.dart';
import 'package:eshop/features/products/domain/entity/meta_entity.dart';
import 'package:eshop/features/products/domain/entity/single_product_entity.dart';
class ProductEntity extends Equatable {
  final ProductMetaEntity meta;
  final List<SingleProductEntity> products;
  const ProductEntity({
    required this.meta,
    required this.products,
  });
  @override
  List<Object?> get props => [meta, products];
}