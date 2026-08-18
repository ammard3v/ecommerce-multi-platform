import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/search_repository.dart';
class RemoveSpecificTextUsecase implements UseCase<List<String?>, String> {
  const RemoveSpecificTextUsecase(this._searchRepository);
  final SearchRepository _searchRepository;
  @override
  ResultFuture<List<String?>> call(String text) async {
    return await _searchRepository.clearSpecificText(searchText: text);
  }
}