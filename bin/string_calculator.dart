import 'dart:io';

import 'package:string_calculator/string_calculator.dart';

void main(List<String> arguments) {
  final calculator = StringCalculator();

  print('\n\nWelcome to the String Calculator!');
  print('\nEnter numbers separated by commas');

  while (true) {
    stdout.write('\nEnter input (or type "exit" to quit): ');
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') {
      print('Goodbye!');
      break;
    }

    try {
      int result = calculator.add(input);
      print('Result: $result');
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}
