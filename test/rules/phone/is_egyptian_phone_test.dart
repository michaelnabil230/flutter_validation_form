import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsEgyptianPhone', () {
    test('should return true if the input is a valid Egyptian phone number',
        () {
      final rule = Validations.isEgyptianPhone..attribute = 'phone';

      expect(rule.isValid('01123456789'), isTrue);
      expect(rule.isValid('01234567890'), isTrue);
      expect(rule.isValid('01000000000'), isTrue);
      expect(rule.isValid('01555555555'), isTrue);
      expect(
          rule.error, 'The phone field must be a valid Egyptian phone number.');
    });

    test(
        'should return false if the input is not a valid Egyptian phone number',
        () {
      final rule = Validations.isEgyptianPhone;

      expect(rule.isValid('1234567890'), isFalse);
      expect(rule.isValid('01234567'), isFalse);
      expect(rule.isValid('011234567890'), isFalse);
      expect(rule.isValid('010123456789'), isFalse);
      expect(rule.isValid('0123456'), isFalse);
    });
  });
}
