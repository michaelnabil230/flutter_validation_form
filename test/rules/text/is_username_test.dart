import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsUserName', () {
    test('should return true if the input is a valid username', () {
      final rule = Validations.isUserName;

      expect(rule.isValid('michael_nabil'), isTrue);
      expect(rule.isValid('michaelnabil123'), isTrue);
      expect(rule.isValid('m_nabil'), isTrue);
    });

    test('should return false if the input is not a valid username', () {
      final rule = Validations.isUserName;

      expect(rule.isValid('michael nabil'), isFalse);
      expect(rule.isValid('michael!nabil'), isFalse);
      expect(rule.isValid('michaelnabil1234567890'), isFalse);
      expect(rule.isValid('mn'), isFalse);
    });
  });
}
