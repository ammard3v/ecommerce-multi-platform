import 'package:flutter/material.dart';
import '../../../domain/entity/order_entity.dart';
import '../../../../../utils/constants/device_helpers.dart';
class OrderShortTimeline extends StatelessWidget {
  const OrderShortTimeline({
    super.key,
    required this.orderItemsEntity,
  });
  final OrderItemsEntity orderItemsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Order Details"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Expected Delivery Date"),
            Text(orderItemsEntity.title),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tracking ID"),
            Text(orderItemsEntity.id),
          ],
        ),
      ],
    );
  }
}