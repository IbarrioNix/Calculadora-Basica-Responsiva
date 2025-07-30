import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../screens/calculator_screen.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

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