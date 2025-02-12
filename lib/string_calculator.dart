class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String numberString = numbers;

    // Define an array of delimiters used to separate numbers
    const delimiters = [",", "\n"];

    // Create a regex pattern by escaping each delimiter and joining them with '|'
    final regexPattern = delimiters.map(RegExp.escape).join('|');

    final numberList = numberString.split(RegExp(regexPattern)).map(int.parse);

    return numberList.reduce((sum, n) => sum + n);
  }
}
