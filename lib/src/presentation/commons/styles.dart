/// All colors
/// k --> constant (Flutter guidelines)
/// BD --> BuzzerDoor

import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyles {
  /// --------------------------------------------------------------------------
  ///                     Commons Colors
  /// --------------------------------------------------------------------------
  static const Color colorBlue = Colors.blue;
  static const Color colorOrange = Colors.deepOrange;
  static const Color colorPink = Colors.pink;
  static const Color colorWhite = Colors.white;
  static const Color colorBlack = Colors.black;

  /// --------------------------------------------------------------------------
  ///                        Misc Colors
  /// --------------------------------------------------------------------------
  static const Color successColor = Colors.green;
  static const Color warningColor = Colors.yellow;
  static const Color errorColor = Colors.red;

  /// --------------------------------------------------------------------------
  ///                       Basics Colors
  /// --------------------------------------------------------------------------

  static const Color primaryColor = Color(0xFF2196f3);
  static const Color primaryColorLight = Color(0xFF6ec6ff);
  static const Color primaryColorDark = Color(0xFF0069c0);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFFFF5722);
  static const Color accentColorLight = Color(0xFFff8a50);
  static const Color accentColorDark = Color(0xFFc41c00);

  /// Texts
  static const Color textOnAccent = Color(0xFFFFFFFF);

  /// Backgrounds
  static const Color defaultBackgroundColor = Color(0xFFFFFFFF);
  static const Color backgroundColorLight = defaultBackgroundColor;
  static const Color backgroundColorDark = Color(0xFF353A3A);

  /// --------------------------------------------------------------------------
  ///                       Card Styles
  /// --------------------------------------------------------------------------
  static const Color cardBackgroundColor = Color(0xFFFFFFFF);
  static const Color cardBackgroundColorLight = defaultBackgroundColor;
  static const Color cardBackgroundColorDark = Color(0xFF353A3A);
  static const double cardDefaultElevation = 2.0;
  static const EdgeInsets cardDefaultPadding = EdgeInsets.all(20.0);
  static const double cardBorderRadius = 8.0;

  /// --------------------------------------------------------------------------
  ///                           Forms
  /// --------------------------------------------------------------------------

  static const EdgeInsets formDefaultInputPadding = EdgeInsets.all(
    15.0,
  );

  /// Profile
  static const double profileAvatarMin = 5.0;
  static const double profileAvatarMax = 50.0;
  static const double profileAvatarElevation = 2.0;

  /// Auth Page
  static const double authPageMinHeight = 800.0;
}
