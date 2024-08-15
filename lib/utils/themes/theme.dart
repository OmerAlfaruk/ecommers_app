
import 'package:ecommerce/utils/themes/text_field_theme.dart';
import 'package:ecommerce/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'bottom_sheet_theme.dart';
import 'chekbox_theme.dart';
import 'chip_theme.dart';
import 'elevated_button_theme.dart';
import 'outlined_button_theme.dart';

class OAppTheme {
  OAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      appBarTheme: OAppBarTheme.lightAppBarTheme,
      scaffoldBackgroundColor: Colors.white,
      textTheme: OTextTheme.lightTexTheme,
      checkboxTheme: OCheckBoxTheme.lightCheckboxTheme,
      chipTheme: OChipTheme.lightChipTheme,
      bottomSheetTheme: OBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: OElevatedButtonTheme.lightElevateButtonTheme,
      outlinedButtonTheme: OOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: OTextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      appBarTheme: OAppBarTheme.darkAppBarTheme,
      scaffoldBackgroundColor: Colors.black,
      textTheme: OTextTheme.darkTexTheme,
      checkboxTheme: OCheckBoxTheme.darkCheckboxTheme,
      chipTheme: OChipTheme.darkChipTheme,
      bottomSheetTheme: OBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: OElevatedButtonTheme.darkElevateButtonTheme,
      outlinedButtonTheme: OOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: OTextFormFieldTheme.darkInputDecorationTheme);
}
