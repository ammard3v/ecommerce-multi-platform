import 'usecase.dart';
class UpdateCategoryUsecase
    implements UseCase<CategoryEntity, UpdateCategoryReq> {
  final CategoryRepository categoryRepository;
  const UpdateCategoryUsecase(this.categoryRepository);
  @override
  ResultFuture<CategoryEntity> call(UpdateCategoryReq params) async {
    return await categoryRepository.updateCategory(params);
  }
}