part of 'search_product_cubit.dart';
abstract class SearchProductState {}
class SearchProductInitial extends SearchProductState {}
class SearchProductLoading extends SearchProductState {}
class SearchProductLoaded extends SearchProductState {
  final ProductEntity productEntity;
  SearchProductLoaded(this.productEntity);
}
class SortProductLoaded extends SearchProductState {
  final ProductEntity productEntity;
  SortProductLoaded(this.productEntity);
}
class SearchCache extends SearchProductState {
  final List<String> storedSearches;
  SearchCache(this.storedSearches);
}
class AllHistoryRemove extends SearchProductState {
  AllHistoryRemove();
}
class SearchCacheSaved extends SearchProductState {
  final String message;
  SearchCacheSaved(this.message);
}
class SearchCacheSuccess extends SearchProductState {
  final String message;
  SearchCacheSuccess(this.message);
}
class SearchCacheFailure extends SearchProductState {
  final String message;
  SearchCacheFailure(this.message);
}
class SearchCacheLoaded extends SearchProductState {
  final List<String?> storedData;
  SearchCacheLoaded({
    required this.storedData,
  });
}
class SearchProductFailure extends SearchProductState {
  final String message;
  SearchProductFailure(this.message);
}