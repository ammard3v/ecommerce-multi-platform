import 'repository.dart';
abstract class CategoryRepository {
  ResultFuture<List<CategoryEntity>> fetchAllCategories();
  ResultFuture<CategoryEntity> fetchCategoryById({
    required String id,
  });
  ResultFuture<CategoryEntity> createCategory(
    CreateCategoryReq createCategoryReq,
  );
  ResultFuture<CategoryEntity> updateCategory(
    UpdateCategoryReq updateCategoryReq,
  );
  ResultFuture<void> deleteCategory({
    required String id,
  });
}