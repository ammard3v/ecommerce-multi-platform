import 'usecase.dart';
class SetDefaultAddressUsecase implements UseCase<AddressEntity, String> {
  final AddressRepository addressRepository;
  const SetDefaultAddressUsecase(this.addressRepository);
  @override
  ResultFuture<AddressEntity> call(String params) async {
    return await addressRepository.setDefaultAddress(params);
  }
}