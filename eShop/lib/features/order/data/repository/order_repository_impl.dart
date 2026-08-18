import 'dart:async';
import 'package:flutter/foundation.dart';
import '../model/order_model.dart';
import '../model/order_status_model.dart';
import '../model/order_status_req.dart';
import '../../domain/entity/order_status_entity.dart';
import 'repository.dart';
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;
  OrderRepositoryImpl({
    required this.orderRemoteDataSource,
  });
  @override
  ResultFuture<List<OrderEntity>> fetchOrderForUser() async {
    try {
      final response = await orderRemoteDataSource.fetchOrderForUser();
      return Right(response.data.toEntityList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<OrderEntity> createOrderCash() async {
    try {
      final response = await orderRemoteDataSource.createOrderCash();
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<OrderEntity> checkPaidOrderStatus(String paymentIntentId) async {
    const pollInterval = Duration(seconds: 5);
    const maxAttempts = 12;
    int attempt = 0;
    while (attempt < maxAttempts) {
      attempt++;
      try {
        final response =
            await orderRemoteDataSource.checkPaidOrderStatus(paymentIntentId);
        final order = response.data;
        if (order != null) {
          if (order.paymentResult!.status == 'succeeded') {
            return Right(order.toEntity());
          }
        }
        debugPrint('Attempt $attempt: Payment not completed yet.');
      } on DioException catch (e) {
        if (e.response?.statusCode == 404 &&
            e.response?.data['error'] == 'Order not found yet') {
          debugPrint('Attempt $attempt: Order not created yet, retrying...');
        } else {
          return Left(ServerFailure(e.message ?? 'Dio error occurred'));
        }
      } catch (e) {
        return Left(ServerFailure('Unexpected error occurred'));
      }
      await Future.delayed(pollInterval);
    }
    return Left(ServerFailure('Payment not completed within timeout'));
  }
  @override
  ResultFuture<OrderEntity> fetchOrderStatus(String orderId) async {
    try {
      final response = await orderRemoteDataSource.fetchOrderStatus(orderId);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}