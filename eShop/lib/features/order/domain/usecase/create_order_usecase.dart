import 'package:eshop/core/usecase/usecase.dart';
import 'package:eshop/features/order/data/repository/repository.dart';
class CreateOrderUsecase implements UseCaseWithoutParams<OrderEntity> {
  final OrderRepository orderRepository;
  const CreateOrderUsecase(this.orderRepository);
  @override
  ResultFuture<OrderEntity> call() async {
    return await orderRepository.createOrderCash();
  }
}