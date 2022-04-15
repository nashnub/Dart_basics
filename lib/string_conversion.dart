class StringCoversion {
  List<num> stringToNums(String str) {
    final result = <num>[];
    final tokens = str.split(' ');
    for (var token in tokens) {
      final number = num.tryParse(token);
      if (number != null) {
        result.add(number);
      }
    }
    // Commented out due to double parsing
    // tokens
    //     .map((e) => {
    //           if (num.tryParse(e) != null) {result.add(num.parse(e))}
    //         })
    //     .toList();
    return result;
  }

  Map<String, int> tokensCount(List<String> strings) {
    final result = <String, int>{};
    for (var token in strings) {
      final count = result[token];
      result[token] = (count ?? 0) + 1;
    }
    return result;
  }
}
