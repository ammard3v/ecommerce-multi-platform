part of 'cart_bloc.dart';
abstract class CartState {}
class CartInitialState extends CartState {}
class CartStockFailureState extends CartState {
  final String message;
  CartStockFailureState({
    required this.message,
  });
}
class CartLoadingState extends CartState {}
class CartSuccessState extends CartState {}
class CartStockLimitState extends CartState {
  final String message;
  final List<CartEntity> cart;
  CartStockLimitState(this.cart, this.message);
}
class CartLoadedState extends CartState {
  final List<CartEntity> cart;
  final Set<String> loadingIds;
  final String message;
  CartLoadedState(
      {required this.cart, required this.loadingIds, this.message = ""});
  factory CartLoadedState.initial() {
    return CartLoadedState(cart: [], loadingIds: {}, message: "");
  }
  CartLoadedState copyWith({
    List<CartEntity>? cart,
    Set<String>? loadingIds,
    String? message,
  }) {
    return CartLoadedState(
        cart: cart ?? this.cart,
        loadingIds: loadingIds ?? this.loadingIds,
        message: message ?? "");
  }
}
class CartFailureState extends CartState {
  final String message;
  final int? statusCode;
  CartFailureState({
    required this.message,
    this.statusCode,
  });
}