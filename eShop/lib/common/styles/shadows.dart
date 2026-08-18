import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
class DShadows {
  const DShadows._();
  static final List<BoxShadow> searchBarShadow = [
    BoxShadow(
      blurRadius: 2.0,
      spreadRadius: 4.0,
      color: AppColors.black.withValues(alpha: 0.1),
    ),
  ];
  static final List<BoxShadow> verticalProductShadow = [
    BoxShadow(
      color: AppColors.white.withValues(alpha: .5),
      blurRadius: 70,
      spreadRadius: 5,
      offset: Offset(0, 4),
    ),
  ];
}