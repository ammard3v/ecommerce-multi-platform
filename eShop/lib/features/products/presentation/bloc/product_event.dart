part of 'product_bloc.dart';
abstract class ProductEvent {}
class FetchAllProductEvent extends ProductEvent {
  final FetchProductsReq fetchProductsReq;
  FetchAllProductEvent({
    required this.fetchProductsReq,
  });
}
class FetchSingleProductEvent extends ProductEvent {
  final String id;
  FetchSingleProductEvent({
    required this.id,
  });
}
class FetchFeaturedProductEvent extends ProductEvent {
  final FetchProductsReq fetchProductsReq;
  FetchFeaturedProductEvent({
    required this.fetchProductsReq,
  });
}
class FetchProductByCategoryEvent extends ProductEvent {
  final String id;
  FetchProductByCategoryEvent({
    required this.id,
  });
}