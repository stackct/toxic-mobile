import 'package:flutter/material.dart';

class UITheme {
  static final ThemeData appTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: TOXIC_GREEN,
      primaryColorDark: TOXIC_GREEN_ALT,
      accentColor: Colors.blue);

  static const Color TOXIC_GREEN = Color.fromARGB(255, 0, 166, 90);
  static const Color TOXIC_GREEN_ALT = Color.fromARGB(255, 0, 141, 76);
  static const Color TOXIC_RED = Color.fromARGB(255, 221, 75, 64);
  static const Color TOXIC_RED_ALT = Color.fromARGB(255, 215, 57, 37);
  static const Color TOXIC_ALMOST_BLACK = Color.fromARGB(255, 34, 36, 50);
  static const Color TOXIC_ALMOST_BLACK_ALT = Color.fromARGB(255, 30, 40, 44);
  static const Color TOXIC_GRAY = Color.fromARGB(255, 210, 214, 222);
  static const Color TOXIC_YELLOW = Color.fromARGB(255, 243, 156, 18);
  static const Color TOXIC_AQUA = Color.fromARGB(255, 0, 192, 239);
  static const Color TOXIC_LIGHT_BLUE = Color.fromARGB(255, 60, 141, 188);
}
