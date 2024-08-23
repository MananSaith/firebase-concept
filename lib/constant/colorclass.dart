import 'package:flutter/material.dart';

class MyColors{
   static Color hintInput = const Color(0xFFA5A5A5); 
   static Color black = const Color(0xFF000000);
   static Color verify = const Color(0xFF4A4A4A);
   static Color divider = const Color(0xFFB0B0B0);
   static Color search = const Color(0xFFFBFBFB);
   static Color white = const Color (0xFFFFFFFF);
   static Color blackTransparent = const Color (0x4C000000);
   static Color camelTransparent =const Color.fromARGB(105, 255, 156, 7);
   static Color lowWhite = const Color (0x5FFFFFFF);
   static Color blue = const Color.fromARGB(255, 0, 60, 255);
   static Color camel =const Color.fromARGB(255, 255, 156, 7);
   static Color red =const Color.fromARGB(255, 255, 0, 0);
   static Color green =const Color.fromARGB(255, 0, 156, 0);


   static LinearGradient loginPageBackGround = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [black, blackTransparent], // Define your gradient colors here
   );

}