import '../../data/model/product_sort_req.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../products/domain/entity/product_entity.dart';
abstract class SearchRepository {
  ResultFuture<ProductEntity> fetchSearchProduct(ProductSortReq productSortReq);
  ResultFuture<ProductEntity> fetchSortProduct(ProductSortReq productSortReq);
  ResultVoid saveSearchTexts({required String text});
  ResultFuture<List<String?>> getSaveSearchTexts();
  ResultVoid removeSearchHistoryAll();
  ResultFuture<List<String?>> clearSpecificText({
    required String searchText,
  });
}