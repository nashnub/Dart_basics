class StringCoversion {
  List<num> stringToNums(String str) {
    final result = <num>[];
    final tokens = str.split(' ');
    tokens
        .map((e) => {
              if (num.tryParse(e) != null) {result.add(num.parse(e))}
            })
        .toList();
    return result;
  }
}
