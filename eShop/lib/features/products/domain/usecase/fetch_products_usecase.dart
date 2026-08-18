import 'usecase.dart';
class FetchProductsUsecase implements UseCase<ProductEntity, FetchProductsReq> {
  final ProductRepository _productRepository;
  const FetchProductsUsecase(this._productRepository);
  @override
  ResultFuture<ProductEntity> call(FetchProductsReq params) async {
    return await _productRepository.fetchAllProducts(params);
  }
}