import 'dart:core';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primaryColor = Color(0xFF128041);
  static const Color secondaryColor = Color(0xFF444242);
  static const Color expandedList = Color(0xFFECECEC);
  static const Color shadowText = Color(0xFFF1F2F7);
  static const Color shadowText2 = Color(0xFFB0B0B0);
  static const Color linkColor = Color(0xFF989BA5);
  static const Color appDrawerTextColor = Color(0xFF4D4D4D);
  static const Color publicationTextColor = Color(0xFF3B566E);
  static const Color loaderColor = Color(0xFFD8D8D8);
  static const Color bookNameColor = Color(0xFFD8D8D8);
  static const Color tudoColor = Color(0xFFDEAB52);
  static const Color dateColor = Color(0xFF979797);
  static const Color beginGradient = Color(0xFFA48F73);
  static const Color endGradient = Color(0xFF887357);
  static const Color buttonColor = Color.fromARGB(255, 240, 158, 50);
  static const Color deviderColor = Color.fromARGB(255, 93, 155, 139);
  static const Color textFieldBorderColor = Color(0xFFE5E5E5);
  static const Color expandedTilebgColor = Colors.white;
  static const Color drawerLogoColor = Color(0xFFC68A39);
  static const Color drawerLineColor = Color(0xFFEDF5F3);

  static const MaterialColor kToDark = MaterialColor(
    0xFF9C876B, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF9C876B), //10%
      100: Color(0xFF9C876B), //20%
      200: Color(0xFF9C876B), //30%
      300: Color(0xFF9C876B), //40%
      400: Color(0xFF9C876B), //50%
      500: Color(0xFF9C876B), //60%
      600: Color(0xFF9C876B), //70%
      700: Color(0xFF9C876B), //80%
      800: Color(0xFF9C876B), //80%
      900: Color(0xFF9C876B), //80%
    },
  );
}
