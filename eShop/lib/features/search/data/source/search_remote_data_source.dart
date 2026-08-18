import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../category/domain/usecase/usecase.dart';
import '../../../products/data/model/fetch_products_req.dart';
import '../../../products/data/model/product_model.dart';
import '../../../products/data/model/single_product_model.dart';
import '../model/product_sort_req.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'search_remote_data_source.g.dart';
@RestApi()
abstract class SearchRemoteDataSource {
  @factoryMethod
  factory SearchRemoteDataSource(Dio dio) = _SearchRemoteDataSource;
  @GET("/products/search")
  Future<ApiWrapper<List<SingleProductModel>>> fetchSearchProduct(
      @Queries() Map<String, dynamic> queries);
  @GET("/products/search")
  Future<ApiWrapper<List<SingleProductModel>>> fetchSortProduct(
      @Queries() Map<String, dynamic> queries);
}