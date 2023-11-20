import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsLtr', () {
    test('should return true if value is not in a RTL language', () {
      final rule = Validations.isLtr..attribute = 'language';

      expect(rule.isValid('English'), isTrue);
      expect(rule.isValid('123'), isTrue);
      expect(rule.error, 'The language field must be in English language.');
    });

    test('should return false if value is in a RTL language', () {
      final rule = Validations.isLtr;

      expect(rule.isValid('عربي'), isFalse);
      expect(rule.isValid('١٢٣'), isFalse);
    });

    test('should return false if value is empty', () {
      final rule = Validations.isLtr;

      expect(rule.isValid(''), isFalse);
    });
  });
}
