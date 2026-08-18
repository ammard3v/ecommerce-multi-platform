part of 'wishlist_cubit.dart';
abstract class WishlistState {}
class WishlistInitial extends WishlistState {}
class WishlistLoading extends WishlistState {}
class WishlistSuccess extends WishlistState {}
class WishlistLoaded extends WishlistState {
  final List<WishlistEntity> wishlist;
  final Set<String> loadingProductIds;
  WishlistLoaded({required this.wishlist, this.loadingProductIds = const {}});
  WishlistLoaded copyWith({
    List<WishlistEntity>? wishlist,
    Set<String>? loadingProductIds,
  }) {
    return WishlistLoaded(
      wishlist: wishlist ?? this.wishlist,
      loadingProductIds: loadingProductIds ?? this.loadingProductIds,
    );
  }
}
class WishlistFailure extends WishlistState {
  final String message;
  WishlistFailure(this.message);
}