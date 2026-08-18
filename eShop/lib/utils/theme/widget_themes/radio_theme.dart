import 'package:flutter/material.dart';
import '../../constants/colors.dart';
class DRadioTheme {
  DRadioTheme._();
  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.all(AppColors.primary),
  );
  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.all(AppColors.primary),
  );
}