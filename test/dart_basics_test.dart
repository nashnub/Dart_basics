import 'package:dart_basics/delimeters_calculator.dart';
import 'package:dart_basics/primes.dart';
import 'package:dart_basics/binary_conversion.dart';
import 'package:dart_basics/string_conversion.dart';
import 'package:test/test.dart';

void main() {
  gcdTest();
  lcmTest();
  primesTest();
  binaryTest();
  stringToNumsTest();
  tokensCountTest();
  digitsCount();
}

void gcdTest() {
  test('gcd', () {
    final dc = DelimetersCalculator();
    // Sorted
    expect(dc.gcd([12, 20, 24, 36]), 4);
    // Unsorted
    expect(dc.gcd([24, 12, 36, 20]), 4);
    // Duplicates
    expect(dc.gcd([36, 24, 12, 12, 36, 20]), 4);
    // Large sorted
    expect(dc.gcd([105, 189, 273, 945]), 21);
    // Large unsorted
    expect(dc.gcd([273, 105, 945, 189]), 21);
    // Single zero
    expect(dc.gcd([12, 0, 24, 36]), 12);
    // Two zeros
    expect(dc.gcd([12, 0, 24, 0]), 12);
    // Zeros
    expect(dc.gcd([0, 0, 0, 0]), dc.invalid);
    // Single negative sorted
    expect(dc.gcd([-12, 20, 24, 36]), 4);
    expect(dc.gcd([12, -20, 24, 36]), 4);
    expect(dc.gcd([12, 20, -24, 36]), 4);
    expect(dc.gcd([12, 20, 24, -36]), 4);
    // Single negative unsorted
    expect(dc.gcd([-24, 12, 36, 20]), 4);
    expect(dc.gcd([24, -12, 36, 20]), 4);
    expect(dc.gcd([24, 12, -36, 20]), 4);
    expect(dc.gcd([24, 12, 36, -20]), 4);
    // Two negatives sorted
    expect(dc.gcd([-12, 20, -24, 36]), 4);
    // Two negatives unsorted
    expect(dc.gcd([-24, 12, 36, -20]), 4);
    // Negatives sorted
    expect(dc.gcd([-12, -20, -24, -36]), 4);
    // Negatives unsorted
    expect(dc.gcd([-24, -12, -36, -20]), 4);
    // Empty
    expect(dc.gcd([]), dc.invalid);
  });
}

void lcmTest() {
  test('lcm', () {
    final dc = DelimetersCalculator();
    // Sorted
    expect(dc.lcm([12, 20, 24, 36]), 360);
    // Unsorted
    expect(dc.lcm([24, 12, 36, 20]), 360);
    // Duplicates
    expect(dc.lcm([36, 24, 12, 12, 36, 20]), 360);
    // Large sorted
    expect(dc.lcm([105, 189, 273, 945]), 12285);
    // Large unsorted
    expect(dc.lcm([273, 105, 945, 189]), 12285);
    // Single zero
    expect(dc.lcm([12, 0, 24, 36]), dc.invalid);
    // Two zeros
    expect(dc.lcm([12, 0, 24, 0]), dc.invalid);
    // Zeros
    expect(dc.lcm([0, 0, 0, 0]), dc.invalid);
    // Single negative sorted
    expect(dc.lcm([-12, 20, 24, 36]), 360);
    expect(dc.lcm([12, -20, 24, 36]), 360);
    expect(dc.lcm([12, 20, -24, 36]), 360);
    expect(dc.lcm([12, 20, 24, -36]), 360);
    // Single negative unsorted
    expect(dc.lcm([-24, 12, 36, 20]), 360);
    expect(dc.lcm([24, -12, 36, 20]), 360);
    expect(dc.lcm([24, 12, -36, 20]), 360);
    expect(dc.lcm([24, 12, 36, -20]), 360);
    // Two negatives sorted
    expect(dc.lcm([-12, 20, -24, 36]), 360);
    // Two negatives unsorted
    expect(dc.lcm([-24, 12, 36, -20]), 360);
    // Negatives sorted
    expect(dc.lcm([-12, -20, -24, -36]), 360);
    // Negatives unsorted
    expect(dc.lcm([-24, -12, -36, -20]), 360);
    // Empty
    expect(dc.lcm([]), dc.invalid);
  });
}

void primesTest() {
  test('primes', () {
    final primes = Primes();
    // Simple
    expect(primes.primeFactors(120), [2, 2, 2, 3, 5]);
    // Large
    expect(primes.primeFactors(764390878), [2, 23, 61, 331, 823]);
    // Two
    expect(primes.primeFactors(2), [2]);
    // One
    expect(primes.primeFactors(1), []);
    // Zero
    expect(primes.primeFactors(0), []);
    // Negative
    expect(primes.primeFactors(-7), []);
  });
}

void binaryTest() {
  test('binary', () {
    final conversion = BinaryConversion();
    // Zero
    expect(conversion.toBinary(0), []);
    expect(conversion.fromBinary([0]), 0);
    expect(conversion.fromBinary([]), 0);
    // One
    expect(conversion.toBinary(1), [1]);
    expect(conversion.fromBinary([1]), 1);
    // Simple
    expect(conversion.toBinary(35), [1, 0, 0, 0, 1, 1]);
    expect(conversion.fromBinary([1, 0, 0, 0, 1, 1]), 35);
    // Large
    expect(conversion.toBinary(2647539869778898888), [
      1,
      0,
      0,
      1,
      0,
      0,
      1,
      0,
      1,
      1,
      1,
      1,
      0,
      1,
      1,
      1,
      1,
      1,
      0,
      0,
      1,
      1,
      0,
      1,
      1,
      1,
      1,
      0,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      0,
      1,
      0,
      1,
      1,
      0,
      1,
      1,
      0,
      1,
      0,
      1,
      1,
      1,
      0,
      1,
      1,
      1,
      1,
      1,
      1,
      0,
      0,
      1,
      0,
      0,
      0
    ]);
    expect(
        conversion.fromBinary([
          1,
          0,
          0,
          1,
          0,
          0,
          1,
          0,
          1,
          1,
          1,
          1,
          0,
          1,
          1,
          1,
          1,
          1,
          0,
          0,
          1,
          1,
          0,
          1,
          1,
          1,
          1,
          0,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          0,
          1,
          0,
          1,
          1,
          0,
          1,
          1,
          0,
          1,
          0,
          1,
          1,
          1,
          0,
          1,
          1,
          1,
          1,
          1,
          1,
          0,
          0,
          1,
          0,
          0,
          0
        ]),
        2647539869778898888);
    // Negative
    expect(conversion.toBinary(-465), []);
    // Too long
    expect(conversion.fromBinary(Iterable<int>.generate(65).toList()),
        BinaryConversion().invalid);
    // Not in range
    expect(conversion.fromBinary([0, 1, 0, 1, 2]), BinaryConversion().invalid);
  });
}

void stringToNumsTest() {
  test('stringToNums', () {
    final conversion = StringCoversion();
    // Ints
    expect(conversion.stringToNums('1 2'), [1, 2]);
    expect(conversion.stringToNums('15 three 4 some'), [15, 4]);
    // Negative ints
    expect(conversion.stringToNums('8 -11 day'), [8, -11]);
    // Doubles
    expect(conversion.stringToNums('6 4.762'), [6, 4.762]);
    expect(conversion.stringToNums('7.0 one 6.091 some'), [7.0, 6.091]);
    // Negative doubles
    expect(conversion.stringToNums('-19.34 word -6.12'), [-19.34, -6.12]);
    // Empty
    expect(conversion.stringToNums(''), []);
    // Bad nums
    expect(conversion.stringToNums('23.45% k 6.7 -6.+56 7/3'), [6.7]);
  });
}

void tokensCountTest() {
  test('tokensCount', () {
    final conversion = StringCoversion();
    // Simple
    expect(
        conversion
            .tokensCount(['one', 'two', 'two', 'three', 'three', 'three']),
        {'one': 1, 'two': 2, 'three': 3});
    expect(
        conversion
            .tokensCount(['three', 'two', 'three', 'one', 'three', 'two']),
        {'three': 3, 'two': 2, 'one': 1});
    // Empty
    expect(conversion.tokensCount(['', '']), {'': 2});
    expect(conversion.tokensCount([]), {});
  });
}

void digitsCount() {
  test('digitsCount', () {
    final conversion = StringCoversion();
    // Simple
    expect(
        conversion
            .digitsCount(['one', 'two', 'two', 'three', 'three', 'three']),
        <int>{1, 2, 3});
    expect(
        conversion
            .digitsCount(['three', 'two', 'three', 'one', 'three', 'two']),
        <int>{3, 2, 1});
    // All
    expect(
        conversion.digitsCount([
          'zero',
          'one',
          'two',
          'three',
          'four',
          'five',
          'six',
          'seven',
          'eight',
          'nine'
        ]),
        <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    expect(
        conversion.digitsCount([
          'Zero',
          'ONe',
          'Two',
          'tHrEe',
          'foUR',
          'FiVE',
          'sIx',
          'SEVEN',
          'eIGHt',
          'NIne'
        ]),
        <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    // Empty
    expect(conversion.digitsCount(['', '']), <int>{});
    expect(conversion.digitsCount([]), <int>{});
  });
}
