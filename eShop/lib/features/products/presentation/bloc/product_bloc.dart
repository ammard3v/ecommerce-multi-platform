import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eshop/features/cart/domain/usecase/usecase.dart';
import 'package:eshop/features/products/data/model/fetch_products_req.dart';
import 'package:eshop/features/products/domain/entity/product_entity.dart';
import 'package:eshop/features/products/domain/entity/single_product_entity.dart';
import 'package:eshop/features/products/domain/usecase/add_product_usecase.dart';
import 'package:eshop/features/products/domain/usecase/delete_product_usecase.dart';
import 'package:eshop/features/products/domain/usecase/fetch_product_by_category_usecase.dart';
import 'package:eshop/features/products/domain/usecase/fetch_products_usecase.dart';
import 'package:eshop/features/products/domain/usecase/fetch_single_product_usecase.dart';
import 'package:eshop/features/products/domain/usecase/fetch_top_featured_products_usecase.dart';
part 'product_event.dart';
part 'product_state.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductsUsecase _fetchProductsUsecase;
  final FetchTopFeaturedProductsUsecase _fetchTopFeaturedProductsUsecase;
  final FetchProductByCategoryUsecase _fetchProductByCategoryUsecase;
  final FetchSingleProductUsecase _fetchSingleProductUsecase;
  ProductBloc({
    required FetchProductsUsecase fetchProductsUsecase,
    required FetchSingleProductUsecase fetchSingleProductUsecase,
    required FetchProductByCategoryUsecase fetchProductByCategoryUsecase,
    required FetchTopFeaturedProductsUsecase fetchTopFeaturedProductsUsecase,
  })  : _fetchProductsUsecase = fetchProductsUsecase,
        _fetchTopFeaturedProductsUsecase = fetchTopFeaturedProductsUsecase,
        _fetchSingleProductUsecase = fetchSingleProductUsecase,
        _fetchProductByCategoryUsecase = fetchProductByCategoryUsecase,
        super(ProductInitialState()) {
    on<FetchAllProductEvent>(_onFetchAllProducts);
    on<FetchSingleProductEvent>(_onFetchSingleProduct);
    on<FetchFeaturedProductEvent>(_onFetchFeaturedProducts);
    on<FetchProductByCategoryEvent>(_onFetchProductByCategory);
  }
  Future<void> _onFetchAllProducts(
    FetchAllProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());
    final result = await _fetchProductsUsecase.call(event.fetchProductsReq);
    result.fold(
      (failure) => emit(ProductFailureState(failure.message)),
      (response) => emit(ProductLoadedState(response)),
    );
  }
  Future<void> _onFetchFeaturedProducts(
    FetchFeaturedProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());
    final result =
        await _fetchTopFeaturedProductsUsecase.call(event.fetchProductsReq);
    result.fold(
      (failure) => emit(ProductFailureState(failure.message)),
      (response) => emit(FeaturedProductLoadedState(response)),
    );
  }
  Future<void> _onFetchProductByCategory(
      FetchProductByCategoryEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    final result = await _fetchProductByCategoryUsecase.call(event.id);
    result.fold(
      (failure) => emit(ProductFailureState(failure.message)),
      (response) => emit(ProductLoadedState(response)),
    );
  }
  Future<void> _onFetchSingleProduct(
    FetchSingleProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(SingleProductLoadingState());
    final result = await _fetchSingleProductUsecase.call(event.id);
    result.fold(
      (failure) => emit(ProductFailureState(failure.message)),
      (product) => emit(SingleProductLoadedState(product)),
    );
  }
}