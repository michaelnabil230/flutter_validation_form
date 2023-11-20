import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('MinValue', () {
    test('should return true if value is greater than or equal to min', () {
      final rule = Validations.minValue(50)..attribute = 'number';

      expect(rule.isValid('50'), isTrue);
      expect(rule.isValid('100'), isTrue);
      expect(rule.parameters, [50]);
      expect(rule.error, 'The number field must be at least 50.');
    });

    test('should return false if value is less than min', () {
      final rule = Validations.minValue(50);

      expect(rule.isValid('25'), isFalse);
      expect(rule.isValid('10'), isFalse);
    });

    test('should return false if value is not a valid number', () {
      final rule = Validations.minValue(50);

      expect(rule.isValid('not_a_number'), isFalse);
      expect(rule.isValid('abc'), isFalse);
    });
  });
}
