import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
class ProductImageOverlay extends StatelessWidget {
  const ProductImageOverlay({
    super.key,
    required this.imageUrls,
  });
  final List<String> imageUrls;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundedImage(
          isNetworkImage: imageUrls.isNotEmpty,
          imageUrl: imageUrls.isNotEmpty
              ? imageUrls[0]
              : Assets.defaults.defaultProduct.path,
        ),
        Positioned(
          top: 12,
          child: RoundedContainer(
            radius: AppSizes.sm,
            backgroundColor: AppColors.secondary.withValues(
              alpha: 0.8,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.sm,
              vertical: AppSizes.xs,
            ),
            child: Text(
              '20%',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.black,
                  ),
            ),
          ),
        ),
        const Positioned(
          top: 0,
          right: 0,
          child: CircularIcon(
            icon: Iconsax.heart5,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}