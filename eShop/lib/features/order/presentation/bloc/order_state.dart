part of 'order_bloc.dart';
abstract class OrderState {}
class OrderInitialState extends OrderState {}
class OrderLoadingState extends OrderState {}
class OrderSuccessState extends OrderState {}
class OrderLoadedState extends OrderState {
  final List<OrderEntity> order;
  OrderLoadedState(this.order);
}
class SingleOrderLoadedState extends OrderState {
  final OrderEntity order;
  SingleOrderLoadedState(this.order);
}
class OrderLoadedStatusState extends OrderState {
  final OrderStatusEntity orderStatus;
  final List<OrderEntity> orders;
  OrderLoadedStatusState({
    required this.orderStatus,
    required this.orders,
  });
}
class OrderStatusFailureState extends OrderState {
  final String message;
  OrderStatusFailureState(this.message);
}
class OrderFailureState extends OrderState {
  final String message;
  OrderFailureState(this.message);
}
class PaymentOrderFailureState extends OrderState {
  final String message;
  PaymentOrderFailureState(this.message);
}