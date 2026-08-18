import 'usecase.dart';
class DeleteAddressUsecase implements UseCase<void, String> {
  final AddressRepository addressRepository;
  const DeleteAddressUsecase(this.addressRepository);
  @override
  ResultVoid call(String params) async {
    return await addressRepository.deleteAddress(params);
  }
}