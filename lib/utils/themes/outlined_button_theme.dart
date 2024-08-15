import 'package:flutter/material.dart';

class OOutlinedButtonTheme {
  OOutlinedButtonTheme._();
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        elevation: 0, // Set disabled background color to grey
        side: const BorderSide(color: Colors.blue), // Set border side color to blue
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14,),)// Set padding from vertical to 10
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 0, // Set disabled background color to grey
        side: const BorderSide(color: Colors.blue), // Set border side color to blue
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14,),)// Set padding from vertical to 10
    ),
  );
}
