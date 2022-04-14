class BinaryConversion {
  final invalid = -1;

  List<int> toBinary(int decimal) {
    final result = <int>[];
    if (decimal.isNegative) {
      return result;
    }
    while (decimal > 0) {
      result.add(decimal % 2);
      decimal = decimal >> 1;
    }
    return result.reversed.toList();
  }

  int fromBinary(List<int> binary) {
    if (binary.length > 64) {
      return invalid;
    }
    if (!binary.every((element) => (element == 0) || (element == 1))) {
      return invalid;
    }
    var result = 0;
    for (var i = 0; i < binary.length; ++i) {
      result += binary[binary.length - 1 - i] * (1 << i);
    }
    return result;
  }
}
