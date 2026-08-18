import 'package:bloc/bloc.dart';
import '../../../products/domain/entity/single_product_entity.dart';
import '../../../cart/domain/usecase/usecase.dart';
import '../../../search/data/model/product_sort_req.dart';
import '../../../search/domain/usecase/fetch_sort_products_usecase.dart';
import '../../../search/domain/usecase/remove_all_search_usecase.dart';
import '../../domain/entity/wishlist_entity.dart';
import '../../domain/usecase/add_to_wishlist_usecase.dart';
import '../../domain/usecase/fetch_wishlist_usecase.dart';
import '../../../products/domain/entity/product_entity.dart';
part 'wishlist_state.dart';
class WishlistCubit extends Cubit<WishlistState> {
  final FetchWishlistUsecase fetchWishlistUsecase;
  final AddToWishlistUsecase addToWishlistUsecase;
  WishlistCubit({
    required this.fetchWishlistUsecase,
    required this.addToWishlistUsecase,
  }) : super(WishlistInitial());
  Future<void> fetchWishlist() async {
    emit(WishlistLoading());
    final result = await fetchWishlistUsecase.call(NoParams());
    result.fold(
      (failure) => emit(WishlistFailure(failure.message)),
      (response) {
        emit(WishlistLoaded(
          wishlist: response,
          loadingProductIds: {},
        ));
      },
    );
  }
  Future<void> addToWishlist(String id) async {
    if (state is! WishlistLoaded) return;
    final current = state as WishlistLoaded;
    emit(current.copyWith(
      loadingProductIds: {...current.loadingProductIds, id},
    ));
    final result = await addToWishlistUsecase.call(id);
    result.fold(
      (failure) => emit(current.copyWith(
          loadingProductIds: {...current.loadingProductIds}..remove(id))),
      (response) {
        final updatedList = List<WishlistEntity>.from(current.wishlist);
        final index = updatedList.indexWhere((e) => e.id == response.id);
        if (index != -1) {
          updatedList.removeAt(index);
        } else {
          updatedList.add(response);
        }
        emit(WishlistLoaded(
          wishlist: updatedList,
          loadingProductIds: {...current.loadingProductIds}..remove(id),
        ));
      },
    );
  }
  bool wishlistContains(String id) {
    if (state is WishlistLoaded) {
      return (state as WishlistLoaded).wishlist.any((e) => e.id == id);
    }
    return false;
  }
}