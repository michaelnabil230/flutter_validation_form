import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsNumbersOnly', () {
    test('should return true if value contains only numbers', () {
      final rule = Validations.isNumbersOnly..attribute = 'number';

      expect(rule.isValid('123'), isTrue);
      expect(rule.isValid('4567890'), isTrue);
      expect(rule.error, 'The number field must only contain numbers.');
    });

    test('should return false if value contains non-numeric characters', () {
      final rule = Validations.isNumbersOnly;

      expect(rule.isValid('abc123'), isFalse);
      expect(rule.isValid('1a2b3c'), isFalse);
    });

    test('should return false if value is empty', () {
      final rule = Validations.isNumbersOnly;

      expect(rule.isValid(''), isFalse);
    });
  });
}
