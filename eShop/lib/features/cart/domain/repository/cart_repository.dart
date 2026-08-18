import '../../../auth/domain/entity/nodata_entity.dart';
import 'repository.dart';
abstract class CartRepository {
  ResultFuture<List<CartEntity>> fetchCartForUser();
  ResultFuture<CartEntity> addToCart(AddToCartReq addToCartReq);
  ResultFuture<void> deleteCart(String id);
  ResultFuture<CartEntity> updateCart(AddToCartReq addToCartReq);
}