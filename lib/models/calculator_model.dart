class CalculatorModel {
  // 📊 Variables de estado
  /* Son las variables en las que se almacenaran los datos que son ingresados por el usuario y que se muestran en en la pantalla*/
  String displayText;      // Lo que se muestra en pantalla
  String operation;        // +, -, ×, ÷
  double previousNumber;   // Número anterior para cálculos
  bool waitingForNewNumber; // ¿Está esperando un número nuevo?

  // 🏗️ Constructor
  /* En el constructor definimos las variables de estado, colocando el valor inicial que necesitamos*/
  CalculatorModel({
    this.displayText = '0',
    this.operation = '',
    this.previousNumber = 0,
    this.waitingForNewNumber = false,
  });

  // 🔄 Resetear calculadora
  /* Este metodo sirve para rainiciar los valores de estado a su valor original que le otorguemos, despues de que el usuario los haya modificado */
  void reset() {
    displayText = '0';
    operation = '';
    previousNumber = 0;
    waitingForNewNumber = false;
  }

  // 📋 Crear copia con cambios (patrón copyWith)
  /*  Es para evitar que los valores cambien por error, manteniendo una version anterior*/
  CalculatorModel copyWith({
    String? displayText,
    String? operation,
    double? previousNumber,
    bool? waitingForNewNumber,
  }) {
    return CalculatorModel(
      displayText: displayText ?? this.displayText,
      operation: operation ?? this.operation,
      previousNumber: previousNumber ?? this.previousNumber,
      waitingForNewNumber: waitingForNewNumber ?? this.waitingForNewNumber,
    );
  }
}