import 'package:bloc/bloc.dart';
import '../../data/model/product_sort_req.dart';
import '../../domain/usecase/fetch_sort_products_usecase.dart';
import '../../domain/usecase/remove_all_search_usecase.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../domain/usecase/fetch_search_product_usecase.dart';
import '../../domain/usecase/get_saved_search_usecase.dart';
import '../../domain/usecase/remove_specific_text_usecase.dart';
import '../../domain/usecase/save_search_text_usecase.dart';
part 'search_product_state.dart';
class SearchProductCubit extends Cubit<SearchProductState> {
  final FetchSearchProductUsecase fetchSearchProductUsecase;
  final FetchSortProductsUsecase fetchSortProductsUsecase;
  final GetSavedSearchUsecase getSavedSearchUsecase;
  final SaveSearchTextUsecase saveSearchTextUsecase;
  final RemoveSpecificTextUsecase removeSpecificTextUsecase;
  final RemoveAllSearchUsecase removeAllSearchUsecase;
  SearchProductCubit({
    required this.fetchSearchProductUsecase,
    required this.fetchSortProductsUsecase,
    required this.getSavedSearchUsecase,
    required this.saveSearchTextUsecase,
    required this.removeSpecificTextUsecase,
    required this.removeAllSearchUsecase,
  }) : super(SearchProductInitial());
  Future<void> fetchSearchProduct(ProductSortReq req) async {
    emit(SearchProductLoading());
    final result = await fetchSearchProductUsecase.call(req);
    result.fold(
      (failure) => emit(SearchProductFailure(failure.message)),
      (response) => emit(SearchProductLoaded(response)),
    );
  }
  Future<void> fetchSortedProduct(ProductSortReq req) async {
    emit(SearchProductLoading());
    final result = await fetchSortProductsUsecase.call(req);
    result.fold(
      (failure) => emit(SearchProductFailure(failure.message)),
      (response) => emit(SortProductLoaded(response)),
    );
  }
  Future<void> clearSearchBar() async {
    emit(SearchProductLoading());
    emit(SearchProductInitial());
  }
  Future<void> getStoredTexts() async {
    final result = await getSavedSearchUsecase.call();
    result.fold(
        (failure) => emit(
              SearchCacheFailure(failure.message),
            ), (response) {
      emit(SearchCacheLoaded(storedData: response));
    });
  }
  Future<void> saveStoredTexts(String text) async {
    final result = await saveSearchTextUsecase.call(text);
    result.fold((failure) => emit(SearchCacheFailure(failure.message)), (_) {});
  }
  Future<void> removeSpecificText(String text) async {
    final result = await removeSpecificTextUsecase.call(text);
    result.fold((failure) => emit(SearchCacheFailure(failure.message)),
        (response) {
      emit(SearchCacheLoaded(storedData: response));
    });
  }
  Future<void> removeAllHistory() async {
    final result = await removeAllSearchUsecase.call();
    result.fold((failure) => emit(SearchCacheFailure(failure.message)),
        (response) {
      emit(SearchProductInitial());
    });
  }
}