import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
class DCircularContainer extends StatelessWidget {
  const DCircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.backgroundColor = AppColors.white,
    this.padding,
    this.margin,
    this.child,
  });
  final double height, width;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}