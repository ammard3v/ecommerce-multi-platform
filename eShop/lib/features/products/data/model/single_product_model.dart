import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/single_product_entity.dart';
part 'single_product_model.freezed.dart';
part 'single_product_model.g.dart';
@freezed
abstract class SingleProductModel with _$SingleProductModel {
  const factory SingleProductModel({
    required SingleRatingModel ratings,
    required String title,
    required String description,
    required int price,
    required int discount,
    required List<String> images,
    required int stock,
    @JsonKey(name: 'units_sold') required int unitsSold,
    @JsonKey(name: 'is_featured') required bool isFeatured,
    required SingleCategoryModel category,
    required String slug,
    @JsonKey(name: 'index0Image') required String index0Image,
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _SingleProductModel;
  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      _$SingleProductModelFromJson(json);
}
@freezed
abstract class SingleCategoryModel with _$SingleCategoryModel {
  const factory SingleCategoryModel({
    required String id,
    required String title,
  }) = _SingleCategoryModel;
  factory SingleCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SingleCategoryModelFromJson(json);
}
@freezed
abstract class SingleRatingModel with _$SingleRatingModel {
  const factory SingleRatingModel({
    required double average,
    required int quantity,
  }) = _SingleRatingModel;
  factory SingleRatingModel.fromJson(Map<String, dynamic> json) =>
      _$SingleRatingModelFromJson(json);
}
extension SingleProductModelX on SingleProductModel {
  SingleProductEntity toEntity() => SingleProductEntity(
        ratings: ratings.toEntity(),
        title: title,
        description: description,
        price: price,
        discount: discount,
        images: images,
        stock: stock,
        unitsSold: unitsSold,
        isFeatured: isFeatured,
        category: category.toEntity(),
        slug: slug,
        index0Image: index0Image,
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
extension SingleProductModelListX on List<SingleProductModel> {
  List<SingleProductEntity> toEntityList() =>
      map((value) => value.toEntity()).toList();
}
extension SingleCategoryModelX on SingleCategoryModel {
  SingleCategoryEntity toEntity() => SingleCategoryEntity(id: id, title: title);
}
extension SingleRatingModelX on SingleRatingModel {
  SingleRatingEntity toEntity() =>
      SingleRatingEntity(average: average, quantity: quantity);
}