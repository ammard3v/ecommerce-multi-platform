import 'package:eshop/core/usecase/usecase.dart';
import 'package:eshop/features/order/data/model/order_status_req.dart';
import 'package:eshop/features/order/data/repository/repository.dart';
import 'package:eshop/features/order/domain/entity/order_status_entity.dart';
class FetchOrderStatusUsecase implements UseCase<OrderEntity, String> {
  final OrderRepository orderRepository;
  const FetchOrderStatusUsecase(this.orderRepository);
  @override
  ResultFuture<OrderEntity> call(String params) async {
    return await orderRepository.fetchOrderStatus(params);
  }
}