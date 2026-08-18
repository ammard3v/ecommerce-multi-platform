part of 'address_bloc.dart';
abstract class AddressEvent {}
class FetchAddressEvent extends AddressEvent {}
class AddAddressEvent extends AddressEvent {
  final AddAddressReq addAddressReq;
  AddAddressEvent(this.addAddressReq);
}
class FetchSingleAddressEvent extends AddressEvent {
  final String id;
  FetchSingleAddressEvent({
    required this.id,
  });
}
class DeleteAddressEvent extends AddressEvent {
  final String id;
  DeleteAddressEvent({
    required this.id,
  });
}
class SetDefaultAddressEvent extends AddressEvent {
  final String id;
  SetDefaultAddressEvent({
    required this.id,
  });
}
class UpdateAddressEvent extends AddressEvent {
  final UpdateAddressReq updateAddressReq;
  UpdateAddressEvent(this.updateAddressReq);
}
class AddressResetEvent extends AddressEvent {}