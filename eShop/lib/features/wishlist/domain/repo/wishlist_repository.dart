import '../../../../core/usecase/typedef.dart';
import '../entity/wishlist_entity.dart';
abstract class WishlistRepository {
  ResultFuture<List<WishlistEntity>> fetchAllWishlistItems();
  ResultFuture<WishlistEntity> addProductToWishList(String id);
}