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
    if (index == numbers.length - 1) {
      return numbers[index];
    }
    final number1 = numbers[index];
    final number2 = _gcd(numbers, index + 1);
    if ((number1 == invalid) || (number2 == invalid)) {
      return invalid;
    }
    return _gcdTwoNumbers(number1, number2);
  }

  int _lcm(List<int> numbers, int index) {
    if (index.isNegative) {
      return 0;
    }
    if (index == numbers.length - 1) {
      return numbers[index];
    }
    final number1 = numbers[index];
    final number2 = _lcm(numbers, index + 1);
    if ((number1 == invalid) || (number2 == invalid)) {
      return invalid;
    }
    return _lcmTwoNumbers(number1, number2);
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
    number1 = number1.abs();
    number2 = number2.abs();
    final gcd = _gcdTwoNumbers(number1, number2);
    if (gcd == invalid) {
      return invalid;
    }
    return gcd != 0 ? number1 * number2 ~/ gcd : 0;
  }
}
