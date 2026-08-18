import 'repository.dart';
class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource addressRemoteDataSource;
  AddressRepositoryImpl({
    required this.addressRemoteDataSource,
  });
  @override
  ResultFuture<AddressEntity> addAddress(AddAddressReq addAddressReq) async {
    try {
      final response = await addressRemoteDataSource.addAddress(addAddressReq);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<void> deleteAddress(String id) async {
    try {
      await addressRemoteDataSource.deleteAddress(id);
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<List<AddressEntity>> fetchAddressForUser() async {
    try {
      final response = await addressRemoteDataSource.fetchAddressForUser();
      return Right(response.data.toEntityList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<AddressEntity> fetchSingleAddress(String id) async {
    try {
      final response = await addressRemoteDataSource.fetchSingleAddress(id);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<AddressEntity> setDefaultAddress(String id) async {
    try {
      final response = await addressRemoteDataSource.setDefaultAddress(id);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<AddressEntity> updateAddress(
      UpdateAddressReq updateAddressReq) async {
    try {
      final response =
          await addressRemoteDataSource.updateAddress(updateAddressReq);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}