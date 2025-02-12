import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator', () {
    final calculator = StringCalculator();

    test('Empty string should return 0', () {
      expect(calculator.add(''), equals(0));
    });

    test('Single number should return itself', () {
      expect(calculator.add('1'), equals(1));
    });

    test('Two numbers should return their sum', () {
      expect(calculator.add('1,2'), equals(3));
    });

    test('Multiple numbers should return their sum', () {
      expect(calculator.add('1,2,3,4'), equals(10));
    });

    test('Newline as delimiter should work', () {
      expect(calculator.add('1\n2,3'), equals(6));
    });

    test('Invalid character in numbers should throw FormatException', () {
      expect(() => calculator.add("1;2'3"), throwsFormatException);
    });

    test('Custom delimiter should be supported', () {
      expect(calculator.add('//;\n1;2'), equals(3));
    });

    test(
        'Character other than custom delimiter in numbers should throw FormatException',
        () {
      expect(() => calculator.add("//;\n1;2'3"), throwsFormatException);
    });

    test('Missing numbers after custom delimiter should throw FormatException',
        () {
      expect(() => calculator.add("//;\n"), throwsFormatException);
      expect(() => calculator.add("//;"), throwsFormatException);
    });

    test('Invalid custom delimiter format should throw FormatException', () {
      expect(() => calculator.add("//;1;2;3/n4"), throwsFormatException);
    });

    test('Negative numbers should throw exception', () {
      expect(
          () => calculator.add('1,-2,3,-4'),
          throwsA(predicate((e) =>
              e is ArgumentError &&
              e.message == 'Negative numbers not allowed: -2, -4')));
    });

    test('Ignore empty numbers at the end in input', () {
      expect(calculator.add('1,2,3,'), equals(6));
      expect(calculator.add('1\n2\n3\n'), equals(6));
      expect(calculator.add('//;\n1;2;3;'), equals(6));
    });

    test(
        'Missing numbers after delimiter or multiple delimiter without number should throw FormatException',
        () {
      expect(() => calculator.add('1,,,2,3,'), throwsFormatException);
      expect(() => calculator.add('1\n\n\n2\n3\n'), throwsFormatException);
      expect(() => calculator.add('//;\n1;;2;;3;'), throwsFormatException);
    });
  });
}
