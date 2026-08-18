import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../category/data/source/source.dart';
import '../model/stripe_payment_req.dart';
import '../source/payment_remote_data_source.dart';
import '../../domain/repository/payment_repository.dart';
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  PaymentRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  ResultFuture<String> makePaymentByStripe() async {
    try {
      final response = await remoteDataSource.makePaymentByStripe();
      final clientSecret = response.response.data["clientSecret"];
      final paymentIntentId = response.response.data["paymentIntentId"];
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'AMMAR',
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      return Right(paymentIntentId);
    } on StripeException catch (_) {
      return Left(ServerFailure("Stripe payemnt failed"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data['message'] ?? 'Unexpected error occurred!'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred!'));
    }
  }
}