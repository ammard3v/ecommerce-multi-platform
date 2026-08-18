part of 'product_bloc.dart';
abstract class ProductState {}
class ProductInitialState extends ProductState {}
class ProductLoadingState extends ProductState {}
class SingleProductLoadingState extends ProductState {}
class ProductSuccessState extends ProductState {}
class ProductFailureState extends ProductState {
  final String message;
  ProductFailureState(this.message);
}
class ProductLoadedState extends ProductState {
  final ProductEntity productEntity;
  ProductLoadedState(this.productEntity);
}
class SingleProductLoadedState extends ProductState {
  final SingleProductEntity productEntity;
  SingleProductLoadedState(this.productEntity);
}
class FeaturedProductLoadedState extends ProductState {
  final ProductEntity productEntity;
  FeaturedProductLoadedState(this.productEntity);
}