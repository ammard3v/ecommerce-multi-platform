import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/device_helpers.dart';
class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.6,
            color: dark ? AppColors.darkGrey : AppColors.grey,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            thickness: 0.6,
            color: dark ? AppColors.darkGrey : AppColors.grey,
          ),
        ),
      ],
    );
  }
}