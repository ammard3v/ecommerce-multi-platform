import '../../../../core/network/api_wrapper.dart';
import 'repository.dart';
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImpl({
    required this.categoryRemoteDataSource,
  });
  @override
  ResultFuture<List<CategoryEntity>> fetchAllCategories() async {
    try {
      final response = await categoryRemoteDataSource.fetchAllCategories();
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
  ResultFuture<CategoryEntity> fetchCategoryById({required String id}) async {
    try {
      final response = await categoryRemoteDataSource.fetchCategoryById(id);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<CategoryEntity> createCategory(
    CreateCategoryReq createCategoryReq,
  ) async {
    try {
      final response = await categoryRemoteDataSource.createCategory(
        createCategoryReq,
      );
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
  @override
  ResultFuture<void> deleteCategory({required String id}) async {
    try {
      await categoryRemoteDataSource.deleteCategory(id);
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
  ResultFuture<CategoryEntity> updateCategory(
    UpdateCategoryReq updateCategoryReq,
  ) async {
    try {
      final response =
          await categoryRemoteDataSource.updateCategory(updateCategoryReq);
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