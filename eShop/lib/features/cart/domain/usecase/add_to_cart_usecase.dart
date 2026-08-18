import 'usecase.dart';
class AddToCartUsecase implements UseCase<CartEntity, AddToCartReq> {
  final CartRepository cartRepository;
  const AddToCartUsecase(this.cartRepository);
  @override
  ResultFuture<CartEntity> call(AddToCartReq params) async {
    return await cartRepository.addToCart(params);
  }
}