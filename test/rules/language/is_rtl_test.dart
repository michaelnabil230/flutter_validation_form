import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsRtl', () {
    test('should return true if value is in a RTL language', () {
      final rule = Validations.isRtl..attribute = 'language';

      expect(rule.isValid('عربي'), isTrue);
      expect(rule.isValid('١٢٣'), isTrue);
      expect(rule.error, 'The language field must be in Arabic language.');
    });

    test('should return false if value is not in a RTL language', () {
      final rule = Validations.isRtl;

      expect(rule.isValid('English'), isFalse);
      expect(rule.isValid('123'), isFalse);
    });

    test('should return false if value is empty', () {
      final rule = Validations.isRtl;

      expect(rule.isValid(''), isFalse);
    });
  });
}
