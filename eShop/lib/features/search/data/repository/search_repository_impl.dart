import 'package:fpdart/fpdart.dart';
import '../../../products/data/model/meta_model.dart';
import '../../../products/data/model/single_product_model.dart';
import '../model/product_sort_req.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/typedef.dart';
import '../../../products/data/model/product_model.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../source/search_local_data_source.dart';
import '../source/search_remote_data_source.dart';
import '../../domain/repository/search_repository.dart';
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;
  SearchRepositoryImpl({
    required this.searchRemoteDataSource,
    required this.searchLocalDataSource,
  });
  @override
  ResultFuture<ProductEntity> fetchSearchProduct(
      ProductSortReq productSortReq) async {
    try {
      final response = await searchRemoteDataSource
          .fetchSearchProduct(productSortReq.toJson());
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
  ResultFuture<ProductEntity> fetchSortProduct(
      ProductSortReq productSortReq) async {
    try {
      final response = await searchRemoteDataSource
          .fetchSortProduct(productSortReq.toJson());
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
  ResultVoid saveSearchTexts({required String text}) async {
    try {
      await searchLocalDataSource.saveSearchTexts(searchText: text);
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
  ResultFuture<List<String?>> getSaveSearchTexts() async {
    try {
      List<String> data = await searchLocalDataSource.getSaveSearchTexts();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<List<String?>> clearSpecificText(
      {required String searchText}) async {
    try {
      List<String> data =
          await searchLocalDataSource.clearSpecificText(searchText: searchText);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultVoid removeSearchHistoryAll() async {
    try {
      await searchLocalDataSource.removeSearchHistoryAll();
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}