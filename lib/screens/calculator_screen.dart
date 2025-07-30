import 'package:flutter/material.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_keyboard.dart';
import '../models/calculator_model.dart';
import '../utils/calculator_logic.dart';
import '../constants/app_constants.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorModel _model = CalculatorModel();

  // 🖥️ Detectar si es web o móvil
  bool get _isWeb => MediaQuery.of(context).size.width > AppConstants.webBreakpoint;

  // 🎯 Manejar presión de botones
  void _handleButtonPress(String text, String type) {
    setState(() {
      switch (type) {
        case 'number':
          _model = CalculatorLogic.pressNumber(_model, text);
          break;
        case 'operation':
          _model = CalculatorLogic.pressOperation(_model, text);
          break;
        case 'equals':
          _model = CalculatorLogic.calculate(_model);
          break;
        case 'decimal':
            _model = CalculatorLogic.pressDecimal(_model);
          break;
        case 'function':
          if (text == 'C') {
            _model = CalculatorLogic.clear(_model);
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        title: Text(AppConstants.appTitle),
        backgroundColor: AppConstants.backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_isWeb ? 32 : 16),
          child: Column(
            children: [
              // 📺 Display
              Expanded(
                flex: 2,
                child: CalculatorDisplay(
                  displayText: _model.displayText,
                  isWeb: _isWeb,
                ),
              ),

              SizedBox(height: 16),

              // ⌨️ Teclado
              Expanded(
                flex: 3,
                child: CalculatorKeyboard(
                  isWeb: _isWeb,
                  onButtonPressed: _handleButtonPress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}