import 'usecase.dart';
class FetchAddressUsecase implements UseCaseWithoutParams<List<AddressEntity>> {
  final AddressRepository addressRepository;
  const FetchAddressUsecase(this.addressRepository);
  @override
  ResultFuture<List<AddressEntity>> call() async {
    return await addressRepository.fetchAddressForUser();
  }
}