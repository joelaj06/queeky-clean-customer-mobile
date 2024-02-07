import 'package:flutter/material.dart';

class SecondaryColor{
  static const MaterialColor color = MaterialColor(_secondaryPrimaryValue, <int, Color>{
    50: Color(0xFFFDF1E0),
    100: Color(0xFFFADDB3),
    200: Color(0xFFF6C780),
    300: Color(0xFFF2B04D),
    400: Color(0xFFF09F26),
    500: Color(_secondaryPrimaryValue),
    600: Color(0xFFEB8600),
    700: Color(0xFFE87B00),
    800: Color(0xFFE57100),
    900: Color(0xFFE05F00),
  });
  static const int _secondaryPrimaryValue = 0xFFED8E00;

  static const MaterialColor secondaryAccent = MaterialColor(_secondaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_secondaryAccentValue),
    400: Color(0xFFFFC3A1),
    700: Color(0xFFFFB388),
  });
  static const int _secondaryAccentValue = 0xFFFFE4D4;
}