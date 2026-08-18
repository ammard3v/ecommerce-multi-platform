import 'package:flutter/material.dart';
import '../../data/model/stripe_payment_req.dart';
import '../../../address/domain/usecase/usecase.dart';
abstract class PaymentRepository {
  ResultFuture<String> makePaymentByStripe();
}