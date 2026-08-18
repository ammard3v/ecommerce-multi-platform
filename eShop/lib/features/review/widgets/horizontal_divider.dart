import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
      ),
    );
  }
}