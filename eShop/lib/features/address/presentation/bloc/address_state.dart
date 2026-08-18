part of 'address_bloc.dart';
abstract class AddressState {}
class AddressInitialState extends AddressState {}
class AddressLoadingState extends AddressState {}
class AddressLoadedState extends AddressState {
  final AddressEntity addressesDataEntity;
  AddressLoadedState(this.addressesDataEntity);
}
class AllAddressLoadedState extends AddressState {
  final List<AddressEntity> addressesDataEntity;
  final String message;
  AllAddressLoadedState({
    required this.addressesDataEntity,
    this.message = "",
  });
}
class AddressFailureState extends AddressState {
  final String message;
  AddressFailureState(this.message);
}