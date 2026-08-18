import '../../data/model/product_sort_req.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../repository/search_repository.dart';
class FetchSearchProductUsecase
    implements UseCase<ProductEntity, ProductSortReq> {
  const FetchSearchProductUsecase(this._searchRepository);
  final SearchRepository _searchRepository;
  @override
  ResultFuture<ProductEntity> call(ProductSortReq params) async {
    return await _searchRepository.fetchSearchProduct(params);
  }
}