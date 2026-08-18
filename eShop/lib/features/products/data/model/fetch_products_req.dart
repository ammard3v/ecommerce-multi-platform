import 'package:eshop/utils/constants/api_constants.dart';
class FetchProductsReq {
  final int page;
  final int limit;
  final String sort;
  FetchProductsReq({
    this.page = Constants.initial_page,
    this.limit = Constants.items_per_page,
    this.sort = "test",
  });
  FetchProductsReq copyWith({
    int? page,
    int? limit,
    String? sort,
  }) {
    return FetchProductsReq(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      sort: sort ?? this.sort,
    );
  }
}