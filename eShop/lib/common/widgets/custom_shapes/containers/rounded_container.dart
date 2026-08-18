import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = AppSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = AppColors.borderPrimary,
    this.backgroundColor = AppColors.white,
    this.padding,
    this.margin,
    this.showBoxShadow = false,
  });
  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final bool showBoxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: showBoxShadow ? boxShadowCustom : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          radius,
        ),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
List<BoxShadow> boxShadowCustom = [
  BoxShadow(
    color: Colors.black.withValues(alpha: 0.05),
    blurRadius: 10,
    offset: const Offset(0, -2),
  ),
];