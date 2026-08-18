import 'package:eshop/core/usecase/usecase.dart';
import 'package:eshop/features/order/data/repository/repository.dart';
class FetchPaidOrderStatusUsecase implements UseCase<OrderEntity, String> {
  final OrderRepository orderRepository;
  const FetchPaidOrderStatusUsecase(this.orderRepository);
  @override
  ResultFuture<OrderEntity> call(String id) async {
    return await orderRepository.checkPaidOrderStatus(id);
  }
}