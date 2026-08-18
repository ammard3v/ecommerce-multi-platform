import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:eshop/core/network/dio_client.dart';
import 'package:eshop/features/order/data/model/order_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:eshop/core/firebase/notification_req.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../../utils/constants/api_constants.dart';
part 'server_call.g.dart';
@RestApi()
abstract class ServerCall {
  @factoryMethod
  factory ServerCall(Dio dio) = _ServerCall;
  @GET("/health/")
  Future<HttpResponse<void>> checkServerHealth();
  @POST("/fcm/save-token/")
  Future<HttpResponse<void>> sendfcmTokenToBackend(
      @Body() NotificationReq notificationReq);
}