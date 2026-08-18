import 'usecase.dart';
class CreateCategoryUsecase
    implements UseCase<CategoryEntity, CreateCategoryReq> {
  final CategoryRepository categoryRepository;
  const CreateCategoryUsecase(this.categoryRepository);
  @override
  ResultFuture<CategoryEntity> call(CreateCategoryReq params) async {
    return await categoryRepository.createCategory(params);
  }
}