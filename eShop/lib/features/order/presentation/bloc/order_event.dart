part of 'order_bloc.dart';
abstract class OrderEvent {}
class FetchOrderEvent extends OrderEvent {}
class FetchOrderStatusEvent extends OrderEvent {
  final String id;
  FetchOrderStatusEvent(this.id);
}
class FetchPaidOrderStatusEvent extends OrderEvent {
  final String id;
  FetchPaidOrderStatusEvent({
    required this.id,
  });
}
class CreateOrderEvent extends OrderEvent {}