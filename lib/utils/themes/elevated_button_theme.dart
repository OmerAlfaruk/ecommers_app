import 'package:flutter/material.dart';

class OElevatedButtonTheme {
  OElevatedButtonTheme._();
  static final lightElevateButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      elevation: 0, // Set disabled background color to grey
      side: const BorderSide(color: Colors.blue), // Set border side color to blue
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10,),)// Set padding from vertical to 10
    ),
  );
  static final darkElevateButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        elevation: 0, // Set disabled background color to grey
        side: const BorderSide(color: Colors.blue), // Set border side color to blue
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10,),)// Set padding from vertical to 10
    ),
  );
}
