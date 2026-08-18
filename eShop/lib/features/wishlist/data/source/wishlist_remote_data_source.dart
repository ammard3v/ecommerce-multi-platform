import 'package:injectable/injectable.dart';
import '../../../../core/network/api_wrapper.dart';
import '../../../../core/network/network.dart';
import '../model/wishlist_model.dart';
import 'package:retrofit/retrofit.dart';
part 'wishlist_remote_data_source.g.dart';
@RestApi()
abstract class WishlistRemoteDataSource {
  @factoryMethod
  factory WishlistRemoteDataSource(Dio dio) = _WishlistRemoteDataSource;
  @GET("/wishlist/me")
  Future<ApiWrapper<List<WishlistModel>>> fetchAllWishlistItems();
  @POST("/wishlist/add/{id}")
  Future<ApiWrapper<WishlistModel>> addProductToWishList(@Path() String id);
}