part of 'category_bloc.dart';
abstract class CategoryEvent {}
class FetchAllCategory extends CategoryEvent {}
class FetchOneCategory extends CategoryEvent {
  final String id;
  FetchOneCategory({required this.id});
}
class CreateCategory extends CategoryEvent {
  final CreateCategoryReq createCategoryReq;
  CreateCategory({required this.createCategoryReq});
}
class UpdateCategory extends CategoryEvent {
  final UpdateCategoryReq updateCategoryReq;
  UpdateCategory({required this.updateCategoryReq});
}
class DeleteCategory extends CategoryEvent {
  final String id;
  DeleteCategory({required this.id});
}