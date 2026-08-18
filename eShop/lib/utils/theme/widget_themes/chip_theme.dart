import 'package:flutter/material.dart';
import '../../constants/colors.dart';
class DChipTheme {
  DChipTheme._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: AppColors.white,
    disabledColor: AppColors.grey,
    labelStyle: const TextStyle(color: AppColors.black),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColors.white,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColors.darkerGrey,
    labelStyle: TextStyle(color: AppColors.white),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColors.white,
  );
}