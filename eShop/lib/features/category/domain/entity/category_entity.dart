import 'package:equatable/equatable.dart';
class CategoryEntity extends Equatable {
  final String title;
  final String image;
  final String id;
  final String createdAt;
  final String updatedAt;
  const CategoryEntity({
    required this.title,
    required this.image,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  List<Object?> get props => [title, image, id, createdAt, updatedAt];
}