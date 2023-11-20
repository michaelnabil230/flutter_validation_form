import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('IsSaudiPhone', () {
    test(
        'should return true if the input is a valid KSA (Kingdom of Saudi Arabia) phone number',
        () {
      final rule = IsSaudiPhone();

      expect(rule.isValid('00966501234567'), isTrue);
      expect(rule.isValid('966512345678'), isTrue);
      expect(rule.isValid('+966512345678'), isTrue);
      expect(rule.isValid('0551234567'), isTrue);
      expect(rule.isValid('551234567'), isTrue);
    });

    test('should return false if the input is not a valid KSA phone number',
        () {
      final rule = IsSaudiPhone();

      expect(rule.isValid('1234567890'), isFalse);
      expect(rule.isValid('0096612345678'), isFalse);
      expect(rule.isValid('0551234'), isFalse);
      expect(rule.isValid('55123456'), isFalse);
    });
  });
}
