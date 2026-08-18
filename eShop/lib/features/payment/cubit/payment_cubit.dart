import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import '../../address/domain/usecase/usecase.dart';
import '../data/model/stripe_payment_req.dart';
import '../domain/usecase/create_payment_usecase.dart';
abstract class PaymentState {}
class PaymentInitial extends PaymentState {}
class PaymentLoading extends PaymentState {}
class PaymentLoaded extends PaymentState {
  final String message;
  PaymentLoaded({required this.message});
}
class PaymentPending extends PaymentState {
  final String paymentIntentId;
  PaymentPending({
    required this.paymentIntentId,
  });
}
class PaymentFailure extends PaymentState {
  final String message;
  PaymentFailure(this.message);
}
class PaymentCubit extends Cubit<PaymentState> {
  final MakePaymentUseCase makePaymentUseCase;
  PaymentCubit({
    required this.makePaymentUseCase,
  }) : super(PaymentInitial());
  Future<void> makePayment() async {
    emit(PaymentLoading());
    final result = await makePaymentUseCase.call();
    result.fold(
      (failure) {
        debugPrint('PAYMENT FAILURE: ${failure.message}');
        emit(PaymentFailure("Sth went wrng"));
      },
      (response) {
        emit(PaymentPending(paymentIntentId: response));
      },
    );
  }
}