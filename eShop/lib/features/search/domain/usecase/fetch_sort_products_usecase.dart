import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../data/model/product_sort_req.dart';
import '../repository/search_repository.dart';
class FetchSortProductsUsecase
    implements UseCase<ProductEntity, ProductSortReq> {
  final SearchRepository _searchRepository;
  const FetchSortProductsUsecase(this._searchRepository);
  @override
  ResultFuture<ProductEntity> call(ProductSortReq params) async {
    return await _searchRepository.fetchSortProduct(params);
  }
}