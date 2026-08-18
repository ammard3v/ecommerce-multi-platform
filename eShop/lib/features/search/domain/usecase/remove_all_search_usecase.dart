import '../../../../core/usecase/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/search_repository_impl.dart';
import '../../data/source/search_local_data_source.dart';
import '../repository/search_repository.dart';
class RemoveAllSearchUsecase implements UseCaseWithoutParams<void> {
  final SearchRepository searchRepository;
  RemoveAllSearchUsecase({
    required this.searchRepository,
  });
  @override
  ResultVoid call() async {
    return await searchRepository.removeSearchHistoryAll();
  }
}