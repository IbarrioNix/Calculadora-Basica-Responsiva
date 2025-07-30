import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CalculatorDisplay extends StatelessWidget {
  final String displayText;
  final bool isWeb;

  const CalculatorDisplay({
    super.key,
    required this.displayText,
    required this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isWeb ? 32 : 20),
      decoration: BoxDecoration(
        color: AppConstants.displayBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(displayText,
      style: TextStyle(
      fontSize: isWeb
      ? AppConstants.webDisplayFontSize
          : AppConstants.mobileDisplayFontSize,
      color: AppConstants.textColor,
      fontWeight: FontWeight.w300,
      fontFamily: 'monospace',
      ),
      textAlign: TextAlign.right,
    ),
    );
  }
}

/*Respuesta a preguntas:
*   1. Para una buena alineacion
*   2. Porque es opcional el isWeb, ya que es una calculadora responsiva y con eso se define si es mobil o web, para que asi se ajuste al tamanio de la pantalla
*   3. En mi caso yo lo use ya que asi los numeros empiezan desde la derecha, y se van recorriendo hacia la izquierda confirme mas caracteres agreguemos
* */