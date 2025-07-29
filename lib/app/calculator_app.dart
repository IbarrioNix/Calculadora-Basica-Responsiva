import 'package:flutter/material.dart';
import '../screens/calculator_screen.dart';
import '../constants/app_constants.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: AppConstants.appTheme,
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}