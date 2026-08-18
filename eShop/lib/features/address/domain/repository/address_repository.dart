import 'repository.dart';
abstract class AddressRepository {
  ResultFuture<List<AddressEntity>> fetchAddressForUser();
  ResultFuture<AddressEntity> addAddress(AddAddressReq addAddressReq);
  ResultFuture<AddressEntity> updateAddress(UpdateAddressReq updateAddressReq);
  ResultFuture<AddressEntity> fetchSingleAddress(String id);
  ResultFuture<AddressEntity> setDefaultAddress(String id);
  ResultFuture<void> deleteAddress(String id);
}