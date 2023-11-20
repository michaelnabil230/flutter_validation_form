import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('Lowercase', () {
    test('returns true for lowercase string', () {
      final rule = Lowercase();
      final isValid = rule.isValid('hello');
      expect(isValid, isTrue);
    });

    test('returns false for uppercase string', () {
      final rule = Lowercase();
      final isValid = rule.isValid('HELLO');
      expect(isValid, isFalse);
    });

    test('returns false for string without any alphabetic characters', () {
      final rule = Lowercase();
      final isValid = rule.isValid('12345');
      expect(isValid, isFalse);
    });
  });
}
