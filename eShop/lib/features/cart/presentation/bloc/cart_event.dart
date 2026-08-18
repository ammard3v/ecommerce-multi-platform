part of 'cart_bloc.dart';
abstract class CartEvent {}
class FetchCartEvent extends CartEvent {}
class AddToCartEvent extends CartEvent {
  final AddToCartReq addToCartReq;
  AddToCartEvent(this.addToCartReq);
}
class DeleteFromCartEvent extends CartEvent {
  final String id;
  DeleteFromCartEvent(this.id);
}
class UpdateCartEvent extends CartEvent {
  final AddToCartReq addToCartReq;
  UpdateCartEvent(this.addToCartReq);
}