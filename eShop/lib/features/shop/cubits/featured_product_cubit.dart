import 'package:bloc/bloc.dart';
import '../../products/data/model/fetch_products_req.dart';
import '../../products/domain/entity/product_entity.dart';
import '../../products/domain/usecase/fetch_top_featured_products_usecase.dart';
abstract class FeaturedProductState {}
class FeaturedProductInitial extends FeaturedProductState {}
class FeaturedProductLoading extends FeaturedProductState {}
class FeaturedProductLoaded extends FeaturedProductState {
  final ProductEntity productEntity;
  FeaturedProductLoaded({required this.productEntity});
}
class FeaturedProductFailure extends FeaturedProductState {
  final String message;
  FeaturedProductFailure(this.message);
}
class FeaturedProductCubit extends Cubit<FeaturedProductState> {
  final FetchTopFeaturedProductsUsecase fetchTopFeaturedProductsUsecase;
  FeaturedProductCubit({
    required this.fetchTopFeaturedProductsUsecase,
  }) : super(FeaturedProductInitial());
  Future<void> fetchFeaturedProducts(FetchProductsReq req) async {
    emit(FeaturedProductLoading());
    final result = await fetchTopFeaturedProductsUsecase.call(req);
    result.fold(
      (failure) => emit(FeaturedProductFailure(failure.message)),
      (entity) => emit(FeaturedProductLoaded(productEntity: entity)),
    );
  }
}