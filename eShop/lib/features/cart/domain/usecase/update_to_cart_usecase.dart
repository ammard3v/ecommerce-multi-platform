import 'package:eshop/features/auth/domain/entity/nodata_entity.dart';
import 'usecase.dart';
class UpdateToCartUsecase implements UseCase<CartEntity, AddToCartReq> {
  final CartRepository cartRepository;
  const UpdateToCartUsecase(this.cartRepository);
  @override
  ResultFuture<CartEntity> call(AddToCartReq params) async {
    return await cartRepository.updateCart(params);
  }
}