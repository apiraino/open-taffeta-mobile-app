/// All colors
/// k --> constant (Flutter guidelines)
/// BD --> BuzzerDoor

import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  /// Colors
  static Color colorBlue = Colors.blue;
  static Color colorOrange = Colors.deepOrange;
  static Color colorPink = Colors.pink;
  static Color colorWhite = Colors.white;
  static Color colorBlack = Colors.black;

  /// Misc Colors
  static Color successColor = Colors.green;
  static Color warningColor = Colors.yellow;
  static Color errorColor = Colors.red;

  /// Basics
  static Color primaryColor = const Color(0xFF2196f3);
  static Color primaryColorLight = const Color(0xFF6ec6ff);
  static Color primaryColorDark = const Color(0xFF0069c0);
  static Color textOnPrimary = const Color(0xFFFFFFFF);
  static Color accentColor = const Color(0xFFFF5722);
  static Color accentColorLight = const Color(0xFFff8a50);
  static Color accentColorDark = const Color(0xFFc41c00);

  /// Texts
  static Color textOnAccent = const Color(0xFFFFFFFF);

  /// Backgrounds
  static Color defaultBackgroundColor = const Color(0xFFFFFFFF);
  static Color backgroundColorLight = defaultBackgroundColor;
  static Color backgroundColorDark = const Color(0xFF353A3A);

  /// Cards
  static Color cardBackgroundColor = const Color(0xFFFFFFFF);
  static Color cardBackgroundColorLight = defaultBackgroundColor;
  static Color cardBackgroundColorDark = const Color(0xFF353A3A);
}
