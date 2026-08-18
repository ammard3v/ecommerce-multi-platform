import 'usecase.dart';
class FetchTopBudgetProductsUsecase
    implements UseCase<ProductEntity, FetchProductsReq> {
  final ProductRepository _productRepository;
  const FetchTopBudgetProductsUsecase(this._productRepository);
  @override
  ResultFuture<ProductEntity> call(FetchProductsReq params) async {
    return await _productRepository.budgetProducts(params);
  }
}