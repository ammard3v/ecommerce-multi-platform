import 'usecase.dart';
class FetchSingleAddressUsecase implements UseCase<AddressEntity, String> {
  final AddressRepository addressRepository;
  const FetchSingleAddressUsecase(this.addressRepository);
  @override
  ResultFuture<AddressEntity> call(String params) async {
    return await addressRepository.fetchSingleAddress(params);
  }
}