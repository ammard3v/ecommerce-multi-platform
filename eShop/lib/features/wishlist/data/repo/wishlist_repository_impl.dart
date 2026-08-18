import 'package:fpdart/fpdart.dart';
import 'package:eshop/core/error/failures.dart';
import 'package:eshop/core/usecase/typedef.dart';
import 'package:eshop/features/wishlist/data/model/wishlist_model.dart';
import 'package:eshop/features/wishlist/data/source/wishlist_remote_data_source.dart';
import 'package:eshop/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:eshop/features/wishlist/domain/repo/wishlist_repository.dart';
import '../../../../core/error/exceptions.dart';
class WishlistRepositoryImpl extends WishlistRepository {
  final WishlistRemoteDataSource wishlistRemoteDataSource;
  WishlistRepositoryImpl({
    required this.wishlistRemoteDataSource,
  });
  @override
  ResultFuture<List<WishlistEntity>> fetchAllWishlistItems() async {
    try {
      final response = await wishlistRemoteDataSource.fetchAllWishlistItems();
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
  ResultFuture<WishlistEntity> addProductToWishList(String id) async {
    try {
      final response = await wishlistRemoteDataSource.addProductToWishList(id);
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