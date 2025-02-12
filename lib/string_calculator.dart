class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String numberString = numbers;

    // Define an array of delimiters used to separate numbers
    final List<String> delimiters = [",", "\n"];

    // Handle custom delimiter
    if (numbers.startsWith('//')) {
      // Fix incorrect newline encoding
      numbers = numbers.replaceAll(r'\n', '\n');

      final parts = numbers.split('\n');

      if (parts.length < 2) {
        throw FormatException(
            "Invalid input format: Missing numbers after delimiter");
      }

      final customDelimiter = parts.first.substring(2);
      delimiters.add(customDelimiter);
      numberString = parts.sublist(1).join('\n');
    }

    // Create a regex pattern by escaping each delimiter and joining them with '|'
    final regexPattern = delimiters.map(RegExp.escape).join('|');

    final numberList = numberString.split(RegExp(regexPattern)).map(int.parse);

    // Handle negative numbers
    final negatives = numberList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError(
          'Negative numbers not allowed: ${negatives.join(', ')}');
    }

    return numberList.reduce((sum, n) => sum + n);
  }
}
