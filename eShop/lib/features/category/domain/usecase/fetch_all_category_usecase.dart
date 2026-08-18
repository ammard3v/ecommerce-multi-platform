import 'usecase.dart';
class FetchAllCategoryUsecase
    implements UseCaseWithoutParams<List<CategoryEntity>> {
  final CategoryRepository categoryRepository;
  const FetchAllCategoryUsecase(this.categoryRepository);
  @override
  ResultFuture<List<CategoryEntity>> call() async {
    return await categoryRepository.fetchAllCategories();
  }
}