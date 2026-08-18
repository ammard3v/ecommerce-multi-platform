import 'package:fpdart/fpdart.dart';
import 'package:eshop/core/error/failures.dart';
import 'package:eshop/features/auth/domain/entity/nodata_entity.dart';
import 'package:eshop/features/cart/data/source/cart_remote_data_source.dart';
import 'package:eshop/features/cart/data/source/source.dart';
import 'repository.dart';
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({
    required this.cartRemoteDataSource,
  });
  @override
  ResultFuture<List<CartEntity>> fetchCartForUser() async {
    try {
      final response = await cartRemoteDataSource.fetchCartForUser();
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
  ResultFuture<CartEntity> addToCart(AddToCartReq addToCartReq) async {
    try {
      final response = await cartRemoteDataSource.addToCart(addToCartReq);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data["message"] ?? "Unexpected Error Occured"));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<void> deleteCart(String id) async {
    try {
      await cartRemoteDataSource.deleteCart(id);
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
  ResultFuture<CartEntity> updateCart(AddToCartReq addToCartReq) async {
    try {
      final response = await cartRemoteDataSource.updateCart(addToCartReq);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}