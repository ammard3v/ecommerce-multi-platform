import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../category/domain/usecase/usecase.dart';
import '../model/fetch_products_req.dart';
import '../model/single_product_model.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import '../model/product_model.dart';
part 'product_remote_data_source.g.dart';
@RestApi()
abstract class ProductRemoteDataSource {
  @factoryMethod
  factory ProductRemoteDataSource(Dio dio) = _ProductRemoteDataSource;
  @GET("/products/")
  Future<ApiWrapper<List<SingleProductModel>>> fetchAllProducts(
    FetchProductsReq fetchProductsReq,
  );
  @GET("/products/top-featured")
  Future<ApiWrapper<List<SingleProductModel>>> featuredProducts(
    FetchProductsReq fetchProductsReq,
  );
  @GET("/products/top-5-cheap")
  Future<ApiWrapper<List<SingleProductModel>>> budgetProducts(
    FetchProductsReq fetchProductsReq,
  );
  @GET("/products/category/{id}")
  Future<ApiWrapper<List<SingleProductModel>>> fetchProductByCategory(
    @Path() String id,
  );
  @GET("/products/{id}")
  Future<ApiWrapper<SingleProductModel>> fetchSingleProductById(
    @Path() String id,
  );
  @POST("/products/")
  Future<ApiWrapper<SingleProductModel>> addProduct();
  @DELETE("/products/{id}")
  Future<void> deleteProduct(
    @Path() String id,
  );
}