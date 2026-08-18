import 'package:bloc/bloc.dart';
import '../../../products/domain/entity/single_product_entity.dart';
import '../../domain/usecase/add_to_cart_usecase.dart';
import '../../domain/usecase/delete_from_cart_usecase.dart';
import '../../domain/usecase/fetch_cart_usecase.dart';
import '../../domain/usecase/update_to_cart_usecase.dart';
import '../../domain/usecase/usecase.dart';
import '../pages/widgets/cart_item.dart';
part 'cart_event.dart';
part 'cart_state.dart';
class CartBloc extends Bloc<CartEvent, CartState> {
  final FetchCartUsecase _fetchCartUsecase;
  final AddToCartUsecase _addToCartUsecase;
  final UpdateToCartUsecase _updateToCartUsecase;
  final DeleteFromCartUsecase _deleteFromCartUsecase;
  CartBloc({
    required FetchCartUsecase fetchCartUsecase,
    required AddToCartUsecase addToCartUsecase,
    required UpdateToCartUsecase updateToCartUsecase,
    required DeleteFromCartUsecase deleteFromCartUsecase,
  })  : _fetchCartUsecase = fetchCartUsecase,
        _addToCartUsecase = addToCartUsecase,
        _updateToCartUsecase = updateToCartUsecase,
        _deleteFromCartUsecase = deleteFromCartUsecase,
        super(CartInitialState()) {
    on<FetchCartEvent>(_onFetchCart);
    on<AddToCartEvent>(_onAddToCart);
    on<UpdateCartEvent>(_onUpdateToCart);
    on<DeleteFromCartEvent>(_onDeleteFromCart);
  }
  Future<void> _onFetchCart(
    FetchCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState());
    final result = await _fetchCartUsecase.call();
    result.fold((failure) => emit(CartFailureState(message: failure.message)),
        (data) => emit(CartLoadedState(cart: data, loadingIds: {})));
  }
  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state is! CartLoadedState) return;
    final current = state as CartLoadedState;
    final id = event.addToCartReq.productId;
    emit(current.copyWith(
      loadingIds: {...current.loadingIds, id},
    ));
    final result = await _addToCartUsecase.call(event.addToCartReq);
    result.fold(
      (failure) {
        emit(current.copyWith(
            loadingIds: Set.of(current.loadingIds)..remove(id),
            message: failure.message));
      },
      (response) {
        final updatedCart = [
          ...current.cart.where((e) => e.product.id != response.product.id),
          response,
        ];
        final updatedLoading = Set<String>.from(current.loadingIds)..remove(id);
        emit(CartLoadedState(
          cart: updatedCart,
          loadingIds: updatedLoading,
        ));
      },
    );
  }
  Future<void> _onUpdateToCart(
    UpdateCartEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state is! CartLoadedState) return;
    final current = state as CartLoadedState;
    final oldCart = current.cart;
    final id = event.addToCartReq.productId;
    emit(current.copyWith(
      loadingIds: {...current.loadingIds, id},
    ));
    final result = await _updateToCartUsecase.call(event.addToCartReq);
    result.fold(
      (failure) {
        emit(current.copyWith(
          loadingIds: current.loadingIds..remove(id),
        ));
      },
      (response) {
        final index =
            oldCart.indexWhere((e) => e.product.id == response.product.id);
        final updatedCart = List<CartEntity>.from(oldCart);
        if (index != -1) {
          updatedCart[index] = response;
        } else {
          updatedCart.add(response);
        }
        final updatedLoading = Set<String>.from(current.loadingIds)..remove(id);
        emit(CartLoadedState(
          cart: updatedCart,
          loadingIds: updatedLoading,
        ));
      },
    );
  }
  Future<void> _onDeleteFromCart(
    DeleteFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state is! CartLoadedState) return;
    final current = state as CartLoadedState;
    final cart = current.cart;
    final id = event.id;
    emit(current.copyWith(
      loadingIds: {...current.loadingIds, id},
    ));
    final result = await _deleteFromCartUsecase.call(id);
    result.fold(
      (failure) {
        emit(current.copyWith(
          loadingIds: current.loadingIds..remove(id),
        ));
      },
      (_) {
        final updatedCart =
            cart.where((item) => item.product.id != id).toList();
        final updatedLoading = Set<String>.from(current.loadingIds)..remove(id);
        emit(CartLoadedState(
          cart: updatedCart,
          loadingIds: updatedLoading,
        ));
      },
    );
  }
  bool cartContains(String id) {
    if (state is CartLoadedState) {
      return (state as CartLoadedState).cart.any((e) => e.product.id == id);
    }
    return false;
  }
}