import 'package:retrofit/retrofit.dart';
import 'source.dart';
part 'address_remote_data_source.g.dart';
@RestApi()
abstract class AddressRemoteDataSource {
  @factoryMethod
  factory AddressRemoteDataSource(Dio dio) = _AddressRemoteDataSource;
  @GET("/address/me")
  Future<ApiWrapper<List<AddressModel>>> fetchAddressForUser();
  @POST("/address/me")
  Future<ApiWrapper<AddressModel>> addAddress(
    @Body() AddAddressReq addAddressReq,
  );
  @GET("/address/{id}")
  Future<ApiWrapper<AddressModel>> fetchSingleAddress(@Path('id') String id);
  @DELETE("/address/{id}")
  Future<void> deleteAddress(@Path() String id);
  @PUT("/address/{id}")
  Future<ApiWrapper<AddressModel>> updateAddress(
    @Body() UpdateAddressReq updateAddressReq,
  );
  @PATCH("/address/{id}/set-default")
  Future<ApiWrapper<AddressModel>> setDefaultAddress(@Path() String id);
}