import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
class DTextFormFieldTheme {
  DTextFormFieldTheme._();
  static final OutlineInputBorder _baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
    borderSide: const BorderSide(width: 1),
  );
  static final TextStyle _baseLabelStyle =
      TextStyle(fontSize: AppSizes.fontSizeMd);
  static final TextStyle _baseHintStyle =
      TextStyle(fontSize: AppSizes.fontSizeSm);
  static final TextStyle _baseErrorStyle =
      const TextStyle(fontStyle: FontStyle.normal);
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: _baseLabelStyle.copyWith(color: AppColors.black),
    hintStyle: _baseHintStyle.copyWith(color: AppColors.black),
    errorStyle: _baseErrorStyle,
    floatingLabelStyle:
        _baseLabelStyle.copyWith(color: AppColors.black.withValues(alpha: 0.8)),
    border: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.grey)),
    enabledBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.grey)),
    focusedBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.darkBackground)),
    errorBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.warning)),
    focusedErrorBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(width: 2, color: AppColors.warning)),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: _baseLabelStyle.copyWith(color: AppColors.white),
    hintStyle: _baseHintStyle.copyWith(color: AppColors.white),
    errorStyle: _baseErrorStyle,
    floatingLabelStyle:
        _baseLabelStyle.copyWith(color: AppColors.white.withValues(alpha: 0.8)),
    border: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.darkGrey)),
    enabledBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.darkGrey)),
    focusedBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.primary)),
    errorBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.warning)),
    focusedErrorBorder: _baseBorder.copyWith(
        borderSide: const BorderSide(width: 2, color: AppColors.warning)),
  );
}