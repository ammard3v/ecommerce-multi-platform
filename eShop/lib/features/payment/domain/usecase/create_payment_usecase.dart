import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/stripe_payment_req.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/payment_repository.dart';
class MakePaymentUseCase implements UseCaseWithoutParams<String> {
  final PaymentRepository paymentRepository;
  const MakePaymentUseCase(this.paymentRepository);
  @override
  ResultFuture<String> call() {
    return paymentRepository.makePaymentByStripe();
  }
}