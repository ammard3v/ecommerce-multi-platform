import '../../domain/entity/category_entity.dart';
class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.title,
    required super.image,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
      image: map['image'] as String,
      id: map['id'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }
}
extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      title: title,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
extension CategoryModelListX on List<CategoryModel> {
  List<CategoryEntity> toEntityList() =>
      map((value) => value.toEntity()).toList();
}