import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../cart/data/source/source.dart';
import '../../../../core/network/api_wrapper.dart';
import '../model/notification_model.dart';
import '../../../../utils/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'notification_remote_data_source.g.dart';
@RestApi()
abstract class NotificationRemoteDataSource {
  @factoryMethod
  factory NotificationRemoteDataSource(Dio dio) = _NotificationRemoteDataSource;
  @GET("/notification/me")
  Future<ApiWrapper<List<NotificationModel>>> fetchNotifications();
}