import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/route_names.dart';
import '../images/rounded_image.dart';
import 'widgets/product_price_text.dart';
import '../../../features/products/data/repository/repository.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
class DProductCardCommon extends StatelessWidget {
  const DProductCardCommon({
    super.key,
    required this.index,
    required this.singleProductEntity,
  });
  final int index;
  final SingleProductEntity singleProductEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(
        RouteNames.singleProduct,
        extra: singleProductEntity,
      ),
      child: RoundedContainer(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundedContainer(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                height: 200,
                child: RoundedImage(
                  borderRadius: AppSizes.productImageRadius,
                  imageUrl: singleProductEntity.images[0],
                )),
            Padding(
              padding: const EdgeInsets.all(AppSizes.xs),
              child: ProductPrice(
                index: index,
                product: singleProductEntity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}