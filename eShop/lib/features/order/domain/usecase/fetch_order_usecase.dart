import 'package:eshop/core/usecase/usecase.dart';
import 'package:eshop/features/order/data/repository/repository.dart';
class FetchOrderUsecase implements UseCaseWithoutParams<List<OrderEntity>> {
  final OrderRepository orderRepository;
  const FetchOrderUsecase(this.orderRepository);
  @override
  ResultFuture<List<OrderEntity>> call() async {
    return await orderRepository.fetchOrderForUser();
  }
}