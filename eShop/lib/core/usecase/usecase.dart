import 'typedef.dart';
abstract class UseCase<SuccessType, Params> {
  ResultFuture<SuccessType> call(Params params);
}
abstract class UseCaseWithoutParams<SuccessType> {
  ResultFuture<SuccessType> call();
}
class NoParams {}