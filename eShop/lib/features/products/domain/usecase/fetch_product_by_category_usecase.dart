import 'usecase.dart';
class FetchProductByCategoryUsecase implements UseCase<ProductEntity, String> {
  final ProductRepository _productRepository;
  const FetchProductByCategoryUsecase(this._productRepository);
  @override
  ResultFuture<ProductEntity> call(String params) async {
    return await _productRepository.fetchProductByCategory(params);
  }
}