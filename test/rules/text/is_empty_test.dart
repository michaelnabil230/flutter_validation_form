import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('IsEmpty', () {
    test('returns true for empty string', () {
      final rule = IsEmpty();
      final isValid = rule.isValid('');
      expect(isValid, isTrue);
    });

    test('returns true for string with only whitespace characters', () {
      final rule = IsEmpty();
      final isValid = rule.isValid('   ');
      expect(isValid, isTrue);
    });

    test('returns false for non-empty string', () {
      final rule = IsEmpty();
      final isValid = rule.isValid('hello');
      expect(isValid, isFalse);
    });

    test('returns false for string with leading or trailing whitespace', () {
      final rule = IsEmpty();
      final isValid = rule.isValid('  hello  ');
      expect(isValid, isFalse);
    });
  });
}
