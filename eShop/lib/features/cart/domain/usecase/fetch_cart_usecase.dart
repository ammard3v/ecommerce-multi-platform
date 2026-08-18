import 'usecase.dart';
class FetchCartUsecase implements UseCaseWithoutParams<List<CartEntity>> {
  final CartRepository cartRepository;
  const FetchCartUsecase(this.cartRepository);
  @override
  ResultFuture<List<CartEntity>> call() async {
    return await cartRepository.fetchCartForUser();
  }
}