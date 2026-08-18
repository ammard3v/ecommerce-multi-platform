import 'usecase.dart';
class FetchTopFeaturedProductsUsecase
    implements UseCase<ProductEntity, FetchProductsReq> {
  final ProductRepository _productRepository;
  const FetchTopFeaturedProductsUsecase(this._productRepository);
  @override
  ResultFuture<ProductEntity> call(FetchProductsReq params) async {
    return await _productRepository.featuredProducts(params);
  }
}