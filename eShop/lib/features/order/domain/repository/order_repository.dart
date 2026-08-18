import '../../data/model/order_status_req.dart';
import '../entity/order_status_entity.dart';
import 'repository.dart';
abstract class OrderRepository {
  ResultFuture<List<OrderEntity>> fetchOrderForUser();
  ResultFuture<OrderEntity> createOrderCash();
  ResultFuture<OrderEntity> checkPaidOrderStatus(String id);
  ResultFuture<OrderEntity> fetchOrderStatus(String orderId);
}