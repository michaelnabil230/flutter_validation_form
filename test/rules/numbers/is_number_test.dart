import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsNumber', () {
    test('should return true if value is a valid number', () {
      final rule = Validations.isNumber..attribute = 'number';

      expect(rule.isValid('123'), isTrue);
      expect(rule.isValid('3.14'), isTrue);
      expect(rule.isValid('-10'), isTrue);
      expect(rule.error, 'The number field must be an integer.');
    });

    test('should return false if value is not a valid number', () {
      final rule = Validations.isNumber;

      expect(rule.isValid('not_a_number'), isFalse);
      expect(rule.isValid('1.23.45'), isFalse);
      expect(rule.isValid('abc'), isFalse);
    });
  });
}
