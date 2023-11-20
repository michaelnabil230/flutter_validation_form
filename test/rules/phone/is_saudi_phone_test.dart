import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsSaudiPhone', () {
    test(
        'should return true if the input is a valid KSA (Kingdom of Saudi Arabia) phone number',
        () {
      final rule = Validations.isSaudiPhone..attribute = 'phone';

      expect(rule.isValid('00966501234567'), isTrue);
      expect(rule.isValid('966512345678'), isTrue);
      expect(rule.isValid('+966512345678'), isTrue);
      expect(rule.isValid('0551234567'), isTrue);
      expect(rule.isValid('551234567'), isTrue);
      expect(
          rule.error, 'The phone field must be a valid Saudi Arabian phone number.');
    });

    test('should return false if the input is not a valid KSA phone number',
        () {
      final rule = Validations.isSaudiPhone;

      expect(rule.isValid('1234567890'), isFalse);
      expect(rule.isValid('0096612345678'), isFalse);
      expect(rule.isValid('0551234'), isFalse);
      expect(rule.isValid('55123456'), isFalse);
    });
  });
}
