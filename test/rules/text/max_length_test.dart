import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('MaxLength', () {
    test('returns true for value with length less than or equal to the maximum',
        () {
      final rule = Validations.maxLength(5);
      final isValid = rule.isValid('hello');
      expect(isValid, true);
    });

    test('returns false for value with length greater than the maximum', () {
      final rule = Validations.maxLength(5);
      final isValid = rule.isValid('hello world');
      expect(isValid, false);
    });

    test('returns true for empty value regardless of the maximum length', () {
      final rule = Validations.maxLength(5);
      final isValid = rule.isValid('');
      expect(isValid, true);
    });
  });
}
