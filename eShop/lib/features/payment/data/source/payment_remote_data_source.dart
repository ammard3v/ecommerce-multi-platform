import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../model/stripe_payment_req.dart';
import '../../../cart/data/source/source.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'payment_remote_data_source.g.dart';
@RestApi()
abstract class PaymentRemoteDataSource {
  @factoryMethod
  factory PaymentRemoteDataSource(Dio dio) = _PaymentRemoteDataSource;
  @POST("/payment/create-intent")
  Future<HttpResponse<void>> makePaymentByStripe();
}