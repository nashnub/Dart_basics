import 'package:dart_basics/delimeters_calculator.dart';
import 'package:dart_basics/primes.dart';

void main(List<String> arguments) {
  // Excercise 2.1 - gcd
  {
    const numbers = [12, 20, 24, 36];
    final result = DelimetersCalculator().gcd(numbers);
    print('gcd of ${numbers.toString()} equals $result');
  }

  // Excercise 2.1 - lcm
  {
    const numbers = [12, 20, 24, 36];
    final result = DelimetersCalculator().lcm(numbers);
    print('lcm of ${numbers.toString()} equals $result');
  }

  // Excercise 2.1 - prime factors
  {
    const number = 120;
    final result = Primes().primeFactors(number);
    print('prime factors of $number are ${result.toString()}');
  }
}
