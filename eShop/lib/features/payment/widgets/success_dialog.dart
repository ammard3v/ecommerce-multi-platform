import 'package:flutter/material.dart';
import '../../../common/widgets/button/main_button.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/device_helpers.dart';
import '../../../utils/constants/sizes.dart';
class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedContainer(
        backgroundColor: AppColors.darkBackground,
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        height: DeviceHelpers.screenHeight(context) / 2.5,
        width: DeviceHelpers.screenWidth(context) - AppSizes.defaultSpace * 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text("Order Successful",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 50),
            MainButton(
              text: "View Order",
              onTap: null,
            )
          ],
        ),
      ),
    );
  }
}