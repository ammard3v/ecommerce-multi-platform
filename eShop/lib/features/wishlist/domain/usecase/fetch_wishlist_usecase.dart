import '../entity/wishlist_entity.dart';
import '../repo/wishlist_repository.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
class FetchWishlistUsecase implements UseCase<List<WishlistEntity>, NoParams> {
  final WishlistRepository wishlistRepository;
  const FetchWishlistUsecase(this.wishlistRepository);
  @override
  ResultFuture<List<WishlistEntity>> call(NoParams params) async {
    return await wishlistRepository.fetchAllWishlistItems();
  }
}