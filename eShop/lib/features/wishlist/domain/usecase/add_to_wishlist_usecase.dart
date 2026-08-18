import '../entity/wishlist_entity.dart';
import '../repo/wishlist_repository.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
class AddToWishlistUsecase implements UseCase<WishlistEntity, String> {
  final WishlistRepository wishlistRepository;
  const AddToWishlistUsecase(this.wishlistRepository);
  @override
  ResultFuture<WishlistEntity> call(String id) async {
    return await wishlistRepository.addProductToWishList(id);
  }
}