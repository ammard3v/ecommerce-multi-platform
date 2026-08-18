import 'package:flutter/material.dart';
import 'widget_themes/radio_theme.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';
import '../constants/colors.dart';
class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: DTextTheme.lightBackgroundTextTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.withValues(alpha: .3),
      selectionHandleColor: AppColors.primary,
    ),
    chipTheme: DChipTheme.lightChipTheme,
    radioTheme: DRadioTheme.lightRadioTheme,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: DAppBarTheme.lightAppBarTheme,
    checkboxTheme: DCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: DBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: DElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: DTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: DTextTheme.darkTextTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.withValues(alpha: .3),
      selectionHandleColor: AppColors.primary,
    ),
    chipTheme: DChipTheme.darkChipTheme,
    radioTheme: DRadioTheme.darkRadioTheme,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: DAppBarTheme.darkAppBarTheme,
    checkboxTheme: DCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: DBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: DElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: DTextFormFieldTheme.darkInputDecorationTheme,
  );
}