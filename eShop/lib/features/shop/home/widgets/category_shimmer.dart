import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';
class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightGrey,
      highlightColor: AppColors.darkGrey,
      child: SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, index) =>
              SizedBox(width: AppSizes.defaultSpace),
          itemBuilder: (context, index) => Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey.withValues(alpha: 0.4),
            ),
          ),
        ),
      ),
    );
  }
}