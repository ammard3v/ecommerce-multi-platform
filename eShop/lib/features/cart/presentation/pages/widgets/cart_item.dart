import 'package:flutter/material.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/device_helpers.dart';
import '../../../../../utils/constants/sizes.dart';
class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          imageUrl: Assets.defaults.defaultProduct.path,
          height: 100,
          width: 100,
          padding: EdgeInsets.all(AppSizes.sm),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.lightGrey,
        ),
        SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTitleText(title: 'PRODUCT TITLE'),
          ],
        ))
      ],
    );
  }
}