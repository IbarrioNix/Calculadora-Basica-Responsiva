import '../models/calculator_model.dart';

class CalculatorLogic {

  // 🔢 MÉTODO 1: Presionar número
  static CalculatorModel pressNumber(CalculatorModel model, String number) {
    // 🤔 PIENSA: ¿Cuándo reemplazar el display y cuándo agregar?

    String newDisplay;
    bool newWaiting = false;

    if (model.waitingForNewNumber || model.displayText == '0') {
      // TODO: Si está esperando número nuevo, reemplazar display
      newDisplay = number;
    } else {
      // TODO: Si no, agregar al display actual
      newDisplay = model.displayText + number;
    }

    return model.copyWith(
      displayText: newDisplay,
      waitingForNewNumber: newWaiting,
    );
  }

  // ➕ MÉTODO 2: Presionar operación
  static CalculatorModel pressOperation(CalculatorModel model, String operation) {
    // 🤔 PIENSA: ¿Qué hacer si ya hay una operación pendiente?

    double currentNumber = double.parse(model.displayText);

    if (model.operation.isNotEmpty && !model.waitingForNewNumber) {
      // TODO: Si hay operación pendiente, calcular primero
      double result = _performCalculation(
        model.previousNumber,
        currentNumber,
        model.operation
      );

      return model.copyWith(
        displayText: _formatNumber(result),
        operation: operation,
        previousNumber: result,
        waitingForNewNumber: true,
      );
    } else {
      // TODO: Si no hay operación pendiente, guardar número y operación
      return model.copyWith(
        operation: operation,
        previousNumber: currentNumber,
        waitingForNewNumber: true,
      );
    }
  }

  // = MÉTODO 3: Calcular resultado
  static CalculatorModel calculate(CalculatorModel model) {
    // 🤔 PIENSA: ¿Qué pasa si no hay operación?

    if (model.operation.isEmpty) {
      return model; // No hay nada que calcular
    }

    double currentNumber = double.parse(model.displayText);
    double result = _performCalculation(
      model.previousNumber,
      currentNumber,
      model.operation
    );

    return model.copyWith(
      displayText: _formatNumber(result),
      operation: '', // Limpiar operación
      previousNumber: result,
      waitingForNewNumber: true,
    );
  }

  // 🧹 MÉTODO 4: Limpiar
  static CalculatorModel clear(CalculatorModel model) {
    // TODO: Crear nuevo modelo limpio
    return CalculatorModel(); // ¿O usar model.reset()?
  }

  // . MÉTODO 5: Presionar punto decimal
  static CalculatorModel pressDecimal(CalculatorModel model) {
    // 🤔 PIENSA: ¿Cuándo agregar punto y cuándo no?

    if (model.displayText.contains('.')) {
      return model; // Ya hay punto
    }

    String newDisplay;
    if (model.waitingForNewNumber) {
      newDisplay = '0.';
    } else {
      newDisplay = model.displayText + '.';
    }

    return model.copyWith(
      displayText: newDisplay,
      waitingForNewNumber: false,
    );
  }

  // 🔧 MÉTODOS AUXILIARES (Ya están hechos)
  static double _performCalculation(double num1, double num2, String operation) {
    switch (operation) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '×':
        return num1 * num2;
      case '÷':
        return num2 != 0 ? num1 / num2 : 0;
      default:
        return num2;
    }
  }

  static String _formatNumber(double number) {
    if (number == number.truncate()) {
      return number.truncate().toString();
    }
    return number.toString();
  }
}