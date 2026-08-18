import 'usecase.dart';
class DeleteFromCartUsecase implements UseCase<void, String> {
  final CartRepository cartRepository;
  const DeleteFromCartUsecase(this.cartRepository);
  @override
  ResultVoid call(String params) async {
    return await cartRepository.deleteCart(params);
  }
}