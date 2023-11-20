import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('Lowercase', () {
    test('returns true for lowercase string', () {
      final rule = Validations.lowercase;
      final isValid = rule.isValid('hello');
      expect(isValid, isTrue);
    });

    test('returns false for uppercase string', () {
      final rule = Validations.lowercase;
      final isValid = rule.isValid('HELLO');
      expect(isValid, isFalse);
    });

    test('returns false for string without any alphabetic characters', () {
      final rule = Validations.lowercase;
      final isValid = rule.isValid('12345');
      expect(isValid, isFalse);
    });
  });
}
