import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('Required', () {
    test('returns true for non-empty string', () {
      final rule = Validations.required;
      expect(rule.isValid('hello'), isTrue);
    });

    test('returns false for empty string', () {
      final rule = Validations.required;
      expect(rule.isValid(''), isFalse);
    });

    test('returns false for string with only whitespace characters', () {
      final rule = Validations.required;
      expect(rule.isValid('   '), isFalse);
    });

    test('returns false for string with leading or trailing whitespace', () {
      final rule = Validations.required;
      expect(rule.isValid('  hello  '), isTrue);
    });
  });
}
