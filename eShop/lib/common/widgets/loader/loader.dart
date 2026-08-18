import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/device_helpers.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
class LoaderDialog {
  static show(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.lightGrey,
          contentPadding: EdgeInsets.all(AppSizes.md),
          scrollable: false,
          surfaceTintColor: AppColors.primary,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: AppColors.primary),
              SizedBox(width: AppSizes.sm),
              Text(
                AppTexts.loadingText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        );
      },
    );
  }
  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}