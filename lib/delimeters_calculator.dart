class DelimetersCalculator {
  final invalid = -1;

  int gcd(List<int> numbers) {
    if (numbers.isEmpty) {
      return invalid;
    }
    return _gcd(numbers, 0);
  }

  int lcm(List<int> numbers) {
    if (numbers.isEmpty) {
      return invalid;
    }
    return _lcm(numbers, 0);
  }

  int _gcd(List<int> numbers, int index) {
    if (index.isNegative) {
      return 0;
    }
    final number = numbers[index];
    if (index == numbers.length - 1) {
      return number;
    }
    final gcd = _gcd(numbers, index + 1);
    if (gcd == invalid) {
      return invalid;
    }
    return _gcdTwoNumbers(number, gcd);
  }

  int _lcm(List<int> numbers, int index) {
    if (index.isNegative) {
      return 0;
    }
    final number = numbers[index];
    if (index == numbers.length - 1) {
      return number;
    }
    final lcm = _lcm(numbers, index + 1);
    if (lcm == invalid) {
      return invalid;
    }
    return _lcmTwoNumbers(number, lcm);
  }

  int _gcdTwoNumbers(int number1, int number2) {
    if ((number1 == 0) && (number2 == 0)) {
      return invalid;
    }
    return _gcdTwoNumbersRecursion(number1.abs(), number2.abs());
  }

  int _gcdTwoNumbersRecursion(int number1, int number2) {
    return number2 != 0
        ? _gcdTwoNumbersRecursion(number2, number1 % number2)
        : number1;
  }

  int _lcmTwoNumbers(int number1, int number2) {
    if ((number1 == 0) || (number2 == 0)) {
      return invalid;
    }
    final gcd = _gcdTwoNumbers(number1, number2);
    if (gcd == invalid) {
      return invalid;
    }
    return gcd != 0 ? number1.abs() * number2.abs() ~/ gcd : 0;
  }
}
