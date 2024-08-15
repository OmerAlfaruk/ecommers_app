import 'package:flutter/material.dart';

class OAppBarTheme {
  OAppBarTheme._();
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      actionsIconTheme: IconThemeData(size: 24,color: Colors.black),
      titleTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black));

  static const AppBarTheme darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      actionsIconTheme: IconThemeData(size: 24,color: Colors.white),
      titleTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white));


}
