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
  });
}
