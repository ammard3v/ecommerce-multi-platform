import 'package:flutter/material.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/device_helpers.dart';
import '../../utils/constants/sizes.dart';
class PromoCodeField extends StatelessWidget {
  const PromoCodeField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return RoundedContainer(
        showBorder: true,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.only(
            left: AppSizes.md,
            right: AppSizes.xs,
            top: AppSizes.xs,
            bottom: AppSizes.xs),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                    hint: Text('Have a promo code?'),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withValues(alpha: 0.2),
                    foregroundColor: dark
                        ? AppColors.lightBackground.withValues(alpha: 0.5)
                        : AppColors.darkBackground.withValues(alpha: 0.5),
                    side:
                        BorderSide(color: Colors.grey.withValues(alpha: 0.1))),
                child: Text('Apply'),
              ),
            )
          ],
        ));
  }
}