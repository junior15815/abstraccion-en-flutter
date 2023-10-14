abstract class Operacion {
  double suma(double a, double b);
  double resta(double a, double b);
  double multiplicacion(double a, double b);
}

class Calculadora extends Operacion {
  @override
  double suma(double a, double b) {
    return a + b;
  }

  @override
  double resta(double a, double b) {
    return a - b;
  }

  @override
  double multiplicacion(double a, double b) {
    return a * b;
  }

  @override
  double division(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      throw ArgumentError("No se puede dividir por cero");
    }
  }
}

void main() {
  final calculadora = Calculadora();

  double numero1 = 10;
  double numero2 = 5;

  print("Suma: ${calculadora.suma(numero1, numero2)}");
  print("Resta: ${calculadora.resta(numero1, numero2)}");
  print("Multiplicación: ${calculadora.multiplicacion(numero1, numero2)}");

  try {
    print("División: ${calculadora.division(numero1, numero2)}");
  } catch (e) {
    print(e);
  }
}