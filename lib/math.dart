class CalculationException implements Exception {
  late String _message;

  CalculationException(String message) {
    _message = message;
  }

  @override
  String toString() => _message;
}

class Math {
  double nthRoot(double number, int power) {
    if (power < 1) {
      throw CalculationException('$power - power less then 1');
    }
    if (number.isNegative && power.isEven) {
      throw CalculationException(
          'cannot calculate ${power}th root of negative number $number');
    }
    const eps = 0.00001;
    var root = number / power;
    var rn = number;
    while ((root - rn).abs() >= eps) {
      rn = number;
      for (var i = 1; i < power; ++i) {
        rn /= root;
      }
      root = 0.5 * (rn + root);
    }
    return root;
  }
}

extension NumberParsing on num {
  num nthRoot(int power) => Math().nthRoot(toDouble(), power);
}
