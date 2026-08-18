import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../domain/usecase/usecase.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'category_remote_data_source.g.dart';
@RestApi()
abstract class CategoryRemoteDataSource {
  @factoryMethod
  factory CategoryRemoteDataSource(Dio dio) = _CategoryRemoteDataSource;
  @GET("/categories/")
  Future<ApiWrapper<List<CategoryModel>>> fetchAllCategories();
  @GET("/categories/{id}")
  Future<ApiWrapper<CategoryModel>> fetchCategoryById(@Path('id') String id);
  @POST("/categories/")
  Future<ApiWrapper<CategoryModel>> createCategory(
    @Body() CreateCategoryReq createCategoryReq,
  );
  @PATCH("/categories/")
  Future<ApiWrapper<CategoryModel>> updateCategory(
    @Body() UpdateCategoryReq updateCategoryReq,
  );
  @DELETE("/categories/{id}")
  Future<ApiWrapper<void>> deleteCategory(@Path('id') String id);
}