import 'usecase.dart';
class AddAddressUsecase implements UseCase<AddressEntity, AddAddressReq> {
  final AddressRepository addressRepository;
  const AddAddressUsecase(this.addressRepository);
  @override
  ResultFuture<AddressEntity> call(AddAddressReq params) async {
    return await addressRepository.addAddress(params);
  }
}