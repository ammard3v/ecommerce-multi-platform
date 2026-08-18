import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/device_helpers.dart';
import '../../../../../utils/constants/sizes.dart';
class AddRemoveQuantity extends StatelessWidget {
  const AddRemoveQuantity({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Row(
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          color: dark ? AppColors.white : AppColors.black,
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.lightGrey,
        ),
        SizedBox(width: AppSizes.spaceBtwItems),
        Text('2'),
        SizedBox(width: AppSizes.spaceBtwItems),
        CircularIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          color: dark ? AppColors.white : AppColors.black,
          backgroundColor: AppColors.primary,
        )
      ],
    );
  }
}