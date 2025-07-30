import 'package:flutter/material.dart';

class AppConstants {

  static const String appTitle = 'Mi Calculadora';

  static const Color backgroundColor = Colors.black;
  static const Color displayBackground = Colors.blueGrey;
  static const Color numberButtonColor = Colors.grey;
  static const Color operatorButtonColor = Colors.orange;
  static const Color functionButtonColor = Colors.white24;
  static const Color textColor = Colors.white;

  static const double mobileButtonSize = 20.0;
  static const double webButtonSize = 30.0;
  static const double mobileFontSize = 20.0 ;
  static const double webFontSize = 24.0;
  static const double mobileDisplayFontSize = 36.0;
  static const double webDisplayFontSize = 48.0;

  static const double webBreakpoint = 600.0;

  static ThemeData get appTheme => ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: backgroundColor,
  );
}