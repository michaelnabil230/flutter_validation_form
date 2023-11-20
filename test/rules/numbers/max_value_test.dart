import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('MaxValue', () {
    test('should return true if value is less than or equal to max', () {
      final rule = Validations.maxValue(100)..attribute = 'number';

      expect(rule.isValid('50'), isTrue);
      expect(rule.isValid('100'), isTrue);
      expect(rule.parameters, [100]);
      expect(rule.error, 'The number field must not be greater than 100.');
    });

    test('should return false if value is greater than max', () {
      final rule = Validations.maxValue(100);

      expect(rule.isValid('150'), isFalse);
      expect(rule.isValid('200'), isFalse);
    });

    test('should return false if value is not a valid number', () {
      final rule = Validations.maxValue(100);

      expect(rule.isValid('not_a_number'), isFalse);
      expect(rule.isValid('abc'), isFalse);
    });
  });
}
