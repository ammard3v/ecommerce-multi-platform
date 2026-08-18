import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
class CustomFloatAction extends StatelessWidget {
  const CustomFloatAction({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      onPressed: onPressed,
      shape: CircleBorder(),
      child: Icon(Iconsax.add),
    );
  }
}