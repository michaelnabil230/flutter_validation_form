import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsEmpty', () {
    test('returns true for empty string', () {
      final rule = Validations.isEmpty;
      expect(rule.isValid(''), isTrue);
    });

    test('returns true for string with only whitespace characters', () {
      final rule = Validations.isEmpty;
      expect(rule.isValid('   '), isTrue);
    });

    test('returns false for non-empty string', () {
      final rule = Validations.isEmpty;
      expect(rule.isValid('hello'), isFalse);
    });

    test('returns false for string with leading or trailing whitespace', () {
      final rule = Validations.isEmpty;
      expect(rule.isValid('  hello  '), isFalse);
    });
  });
}
