import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/search_repository.dart';
class SaveSearchTextUsecase implements UseCase<void, String> {
  const SaveSearchTextUsecase(this._searchRepository);
  final SearchRepository _searchRepository;
  @override
  ResultFuture<void> call(String text) async {
    return await _searchRepository.saveSearchTexts(text: text);
  }
}