import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../model/order_model.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'order_remote_data_source.g.dart';
@RestApi()
abstract class OrderRemoteDataSource {
  @factoryMethod
  factory OrderRemoteDataSource(Dio dio) = _OrderRemoteDataSource;
  @GET("/orders/me")
  Future<ApiWrapper<List<OrderModel>>> fetchOrderForUser();
  @POST("/orders/me")
  Future<ApiWrapper<OrderModel>> createOrderCash();
  @GET("/orders/{orderId}")
  Future<ApiWrapper<OrderModel>> fetchOrderStatus(@Path() String orderId);
  @GET("/orders/payment/{paymentIntentId}")
  Future<ApiWrapper<OrderModel?>> checkPaidOrderStatus(
    @Path('paymentIntentId') String paymentIntentId,
  );
}