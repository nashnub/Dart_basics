import 'dart:math' as math;

class Primes {
  List<int> primeFactors(int number) {
    final result = <int>[];
    if (number <= 1) {
      return result;
    }
    while (number % 2 == 0) {
      result.add(2);
      number = number >> 1;
    }
    for (var i = 3; i <= math.sqrt(number); i += 2) {
      while (number % i == 0) {
        result.add(i);
        number ~/= i;
      }
    }
    if (number > 2) {
      result.add(number);
    }
    return result;
  }
}
