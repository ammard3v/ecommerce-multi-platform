import 'dart:io';
import 'repository.dart';
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({
    required this.productRemoteDataSource,
  });
  @override
  ResultVoid deleteProduct(String id) async {
    try {
      await productRemoteDataSource.deleteProduct(id);
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
  ResultFuture<SingleProductEntity> addProduct(
      AddProductReq addProductReq, List<File> images) {
    throw UnimplementedError();
  }
  @override
  ResultFuture<ProductEntity> budgetProducts(
      FetchProductsReq fetchProductsReq) async {
    try {
      final response =
          await productRemoteDataSource.budgetProducts(fetchProductsReq);
      return Right(
        ProductModel(
          meta: response.meta!.toEntity(),
          products: response.data.toEntityList(),
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<ProductEntity> featuredProducts(
      FetchProductsReq fetchProductsReq) async {
    try {
      final response =
          await productRemoteDataSource.featuredProducts(fetchProductsReq);
      return Right(
        ProductModel(
          meta: response.meta!.toEntity(),
          products: response.data.toEntityList(),
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<ProductEntity> fetchAllProducts(
      FetchProductsReq fetchProductsReq) async {
    try {
      final response =
          await productRemoteDataSource.fetchAllProducts(fetchProductsReq);
      return Right(
        ProductModel(
          meta: response.meta!.toEntity(),
          products: response.data.toEntityList(),
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<ProductEntity> fetchProductByCategory(String id) async {
    try {
      final response = await productRemoteDataSource.fetchProductByCategory(id);
      return Right(
        ProductModel(
          meta: response.meta!.toEntity(),
          products: response.data.toEntityList(),
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<SingleProductEntity> fetchSingleProductById(String id) async {
    try {
      final response = await productRemoteDataSource.fetchSingleProductById(id);
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