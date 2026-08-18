import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../category/data/model/create_category_req.dart';
import '../../../category/data/model/update_category_req.dart';
import '../../../category/domain/entity/category_entity.dart';
import '../../domain/usecase/create_category_usecase.dart';
import '../../domain/usecase/delete_category_usecase.dart';
import '../../domain/usecase/fetch_all_category_usecase.dart';
import '../../domain/usecase/fetch_one_category_usecase.dart';
import '../../domain/usecase/update_category_usecase.dart';
part 'category_event.dart';
part 'category_state.dart';
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final FetchAllCategoryUsecase _fetchAllCategoryUsecase;
  final FetchOneCategoryUsecase _fetchOneCategoryUsecase;
  final CreateCategoryUsecase _createCategoryUsecase;
  final UpdateCategoryUsecase _updateCategoryUsecase;
  final DeleteCategoryUsecase _deleteCategoryUsecase;
  CategoryBloc({
    required FetchAllCategoryUsecase fetchAllCategoryUsecase,
    required FetchOneCategoryUsecase fetchOneCategoryUsecase,
    required CreateCategoryUsecase createCategoryUsecase,
    required UpdateCategoryUsecase updateCategoryUsecase,
    required DeleteCategoryUsecase deleteCategoryUsecase,
  })  : _fetchAllCategoryUsecase = fetchAllCategoryUsecase,
        _fetchOneCategoryUsecase = fetchOneCategoryUsecase,
        _createCategoryUsecase = createCategoryUsecase,
        _updateCategoryUsecase = updateCategoryUsecase,
        _deleteCategoryUsecase = deleteCategoryUsecase,
        super(CategoryInitial()) {
    on<FetchAllCategory>(_onFetchAllCategory);
    on<FetchOneCategory>(_onFetchOneCategory);
    on<CreateCategory>(_onCreateCategory);
    on<UpdateCategory>(_onUpdateCategory);
    on<DeleteCategory>(_onDeleteCategory);
  }
  Future<void> _onFetchAllCategory(
    FetchAllCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _fetchAllCategoryUsecase.call();
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (categories) => emit(CategoryLoadedAll(categories: categories)),
    );
  }
  Future<void> _onFetchOneCategory(
    FetchOneCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _fetchOneCategoryUsecase.call(
      FetchOneCategoryReq(id: event.id),
    );
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategoryLoadedOne(category: category)),
    );
  }
  Future<void> _onCreateCategory(
    CreateCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _createCategoryUsecase.call(event.createCategoryReq);
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategoryLoadedOne(category: category)),
    );
  }
  Future<void> _onUpdateCategory(
    UpdateCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _updateCategoryUsecase.call(event.updateCategoryReq);
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategoryLoadedOne(category: category)),
    );
  }
  Future<void> _onDeleteCategory(
    DeleteCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await _deleteCategoryUsecase.call(
      DeleteCategoryReq(id: event.id),
    );
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (category) => emit(CategorySuccess()),
    );
  }
}