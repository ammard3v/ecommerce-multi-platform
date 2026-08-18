import 'usecase.dart';
class DeleteCategoryUsecase implements UseCase<void, DeleteCategoryReq> {
  final CategoryRepository categoryRepository;
  const DeleteCategoryUsecase(this.categoryRepository);
  @override
  ResultVoid call(DeleteCategoryReq params) async {
    return await categoryRepository.deleteCategory(id: params.id);
  }
}
class DeleteCategoryReq extends Equatable {
  final String id;
  const DeleteCategoryReq({required this.id});
  @override
  List<Object?> get props => [id];
}