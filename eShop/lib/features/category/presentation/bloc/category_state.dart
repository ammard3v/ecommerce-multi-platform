part of 'category_bloc.dart';
abstract class CategoryState {}
class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {}
class CategoryLoadedAll extends CategoryState {
  final List<CategoryEntity> categories;
  CategoryLoadedAll({required this.categories});
}
class CategoryLoadedOne extends CategoryState {
  final CategoryEntity category;
  CategoryLoadedOne({required this.category});
}
class CategoryFailure extends CategoryState {
  final String message;
  CategoryFailure({required this.message});
}