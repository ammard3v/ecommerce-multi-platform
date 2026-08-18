import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../rounded_edges_container.dart';
import 'circular_container.dart';
class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RoundedEdgesContainer(
      child: Container(
        color: AppColors.primary,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -150,
              right: -160,
              child: DCircularContainer(
                height: AppSizes.primaryHeaderHeight,
                width: AppSizes.primaryHeaderHeight,
                backgroundColor: AppColors.white.withValues(alpha: .1),
              ),
            ),
            Positioned(
              top: 50,
              right: -250,
              child: DCircularContainer(
                height: AppSizes.primaryHeaderHeight,
                width: AppSizes.primaryHeaderHeight,
                backgroundColor: AppColors.white.withValues(alpha: .1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}