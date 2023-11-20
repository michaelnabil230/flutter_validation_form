import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('MinLength', () {
    test(
        'returns true for value with length greater than or equal to the minimum',
        () {
      final rule = MinLength(5);
      final isValid = rule.isValid('hello');
      expect(isValid, true);
    });

    test('returns false for value with length less than the minimum', () {
      final rule = MinLength(5);
      final isValid = rule.isValid('hi');
      expect(isValid, false);
    });

    test('returns true for empty value when minimum length is zero', () {
      final rule = MinLength(0);
      final isValid = rule.isValid('');
      expect(isValid, true);
    });

    test('returns false for empty value when minimum length is non-zero', () {
      final rule = MinLength(5);
      final isValid = rule.isValid('');
      expect(isValid, false);
    });
  });
}
