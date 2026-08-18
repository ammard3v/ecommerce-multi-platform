import 'usecase.dart';
class FetchOneCategoryUsecase
    implements UseCase<CategoryEntity, FetchOneCategoryReq> {
  final CategoryRepository categoryRepository;
  const FetchOneCategoryUsecase(this.categoryRepository);
  @override
  ResultFuture<CategoryEntity> call(FetchOneCategoryReq params) async {
    return await categoryRepository.fetchCategoryById(id: params.id);
  }
}
class FetchOneCategoryReq {
  final String id;
  FetchOneCategoryReq({
    required this.id,
  });
}