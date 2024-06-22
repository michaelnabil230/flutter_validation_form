import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsPhone', () {
    test('should return true if the input is a valid phone number', () {
      final rule = Validations.isPhone()..attribute = 'phone';

      expect(rule.isValid('+33686579014'), isTrue);
      expect(rule.isValid('+33655570576'), isTrue);
      expect(rule.isValid('+966512345678'), isTrue);
      expect(rule.error, 'The phone field must be a valid phone number.');
    });

    test('should return false if the input is not a valid phone number', () {
      final rule = Validations.isPhone();

      expect(rule.isValid('1234567890'), isFalse);
      expect(rule.isValid('0096612345678'), isFalse);
      expect(rule.isValid('0551234'), isFalse);
      expect(rule.isValid('55123456'), isFalse);
    });
  });
}
