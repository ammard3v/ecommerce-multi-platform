import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/domain/entity/nodata_entity.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'source.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'cart_remote_data_source.g.dart';
@RestApi()
abstract class CartRemoteDataSource {
  @factoryMethod
  factory CartRemoteDataSource(Dio dio) = _CartRemoteDataSource;
  @GET("/carts/me")
  Future<ApiWrapper<List<CartModel>>> fetchCartForUser();
  @POST("/carts/me")
  Future<ApiWrapper<CartModel>> addToCart(@Body() AddToCartReq addToCartReq);
  @PATCH("/carts/me")
  Future<ApiWrapper<CartModel>> updateCart(@Body() AddToCartReq addToCartReq);
  @DELETE("/carts/{id}")
  Future<void> deleteCart(@Path('id') String id);
}