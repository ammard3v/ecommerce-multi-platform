import '../../../../utils/constants/api_constants.dart';
class ProductSortReq {
  final int page;
  final int limit;
  final String sort;
  final String q;
  ProductSortReq({
    this.page = Constants.initial_page,
    this.limit = Constants.items_per_page,
    this.sort = Constants.sort_default,
    this.q = "",
  });
  ProductSortReq copyWith({
    int? page,
    int? limit,
    String? sort,
    String? q,
  }) {
    return ProductSortReq(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      sort: sort ?? this.sort,
      q: q ?? this.q,
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{'page': page, 'limit': limit, 'sort': sort, "q": q}
      ..removeWhere((_, e) => e == null);
  }
}