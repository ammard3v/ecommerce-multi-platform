import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../domain/entity/order_entity.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/device_helpers.dart';
import '../../../../../utils/constants/sizes.dart';
class OrderDetailText extends StatelessWidget {
  const OrderDetailText({
    super.key,
    required this.orderItemsEntity,
  });
  final OrderItemsEntity orderItemsEntity;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedContainer(
          backgroundColor:
              dark ? AppColors.darkBackground : AppColors.lightBackground,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Row(
              children: [
                RoundedImage(
                  height: 80,
                  width: 80,
                  imageUrl: Assets.defaults.defaultProduct.path,
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderItemsEntity.product),
                      const SizedBox(height: 4),
                      Text("Qty: ${orderItemsEntity.quantity}"),
                      const SizedBox(height: 8),
                      Text("NPR: ${orderItemsEntity.product}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}