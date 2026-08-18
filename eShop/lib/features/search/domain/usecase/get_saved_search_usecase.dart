import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/search_repository.dart';
class GetSavedSearchUsecase implements UseCaseWithoutParams<List<String?>> {
  const GetSavedSearchUsecase(this._searchRepository);
  final SearchRepository _searchRepository;
  @override
  ResultFuture<List<String?>> call() async {
    return await _searchRepository.getSaveSearchTexts();
  }
}