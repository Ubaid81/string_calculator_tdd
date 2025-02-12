class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String numberString = numbers;

    final numberList = numberString.split(",").map(int.parse);

    return numberList.reduce((sum, n) => sum + n);
  }
}
