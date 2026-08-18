import 'usecase.dart';
class UpdateAddressUsecase implements UseCase<AddressEntity, UpdateAddressReq> {
  final AddressRepository addressRepository;
  const UpdateAddressUsecase(this.addressRepository);
  @override
  ResultFuture<AddressEntity> call(UpdateAddressReq params) async {
    return await addressRepository.updateAddress(params);
  }
}