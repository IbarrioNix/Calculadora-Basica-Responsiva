import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CalculatorKeyboard extends StatelessWidget {
  final bool isWeb;
  final Function(String, String) onButtonPressed;

  const CalculatorKeyboard({
    super.key,
    required this.isWeb,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primeras 4 filas (4x4 = 16 botones)
        Expanded(
          flex: 4,
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: isWeb ? 1.5 : 1.0,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: _getButtons().take(16).map((button) {
              return _buildButton(button);
            }).toList(),
          ),
        ),
        SizedBox(height: 8),
        // Última fila especial (0 es más ancho)
        Expanded(
          flex: 1,
          child: _buildBottomRow(),
        ),
      ],
    );
  }

  // 🎛️ Construir botón individual
  Widget _buildButton(Map<String, dynamic> button) {
    return Material(
      color: button['color'],
      borderRadius: BorderRadius.circular(isWeb ? 12 : 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(isWeb ? 12 : 8),
        onTap: () => onButtonPressed(button['text'], button['type']),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            button['text'],
          style: TextStyle(
          fontSize: isWeb
          ? AppConstants.webFontSize
              : AppConstants.mobileFontSize,
          fontWeight: FontWeight.w500,
          color: AppConstants.textColor,
          ),
        ),
      ),
    ),
    );
  }

  // 🔍 RETO: Completa este método
  Widget _buildBottomRow() {
    final buttons = _getButtons();
    return Row(
      children: [
        // Botón 0 (doble ancho)
        Expanded(
          flex: 2,
          child: _buildButton(buttons[16]), // Botón '0'
        ),
        SizedBox(width: 8),
        // Botón punto
        Expanded(
          flex: 1,
          child: _buildButton(buttons[17]), // Botón '.'
        ),
        SizedBox(width: 8),
        // Botón igual
        Expanded(
          flex: 1,
          child: _buildButton(buttons[18]), // Botón '='
        ),
      ],
    );
  }

  List<Map<String, dynamic>> _getButtons() {
    return [
      // Fila 1: Funciones y división
      {'text': 'C',  'color': AppConstants.functionButtonColor, 'type': 'function'},
      {'text': '±',  'color': AppConstants.functionButtonColor, 'type': 'function'},
      {'text': '%',  'color': AppConstants.functionButtonColor, 'type': 'function'},
      {'text': '÷',  'color': AppConstants.operatorButtonColor, 'type': 'operation'},

      // Fila 2: 7, 8, 9, multiplicación
      {'text': '7',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '8',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '9',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '×',  'color': AppConstants.operatorButtonColor, 'type': 'operation'},

      // Fila 3: 4, 5, 6, resta
      {'text': '4',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '5',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '6',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '-',  'color': AppConstants.operatorButtonColor, 'type': 'operation'},

      // Fila 4: 1, 2, 3, suma
      {'text': '1',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '2',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '3',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '+',  'color': AppConstants.operatorButtonColor, 'type': 'operation'},

      // Fila 5: 0, punto, igual
      {'text': '0',  'color': AppConstants.numberButtonColor, 'type': 'number'},
      {'text': '.',  'color': AppConstants.numberButtonColor, 'type': 'decimal'},
      {'text': '=',  'color': AppConstants.operatorButtonColor, 'type': 'equals'},
    ];
  }
}