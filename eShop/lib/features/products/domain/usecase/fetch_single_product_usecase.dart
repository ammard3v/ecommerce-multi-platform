import '../../data/repository/repository.dart';
import 'usecase.dart';
class FetchSingleProductUsecase
    implements UseCase<SingleProductEntity, String> {
  final ProductRepository _productRepository;
  const FetchSingleProductUsecase(this._productRepository);
  @override
  ResultFuture<SingleProductEntity> call(String params) async {
    return await _productRepository.fetchSingleProductById(params);
  }
}