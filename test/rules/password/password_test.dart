import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('Password', () {
    test('should return true for a valid password', () {
      final rule = Password(
        min: 8,
        lowercase: true,
        uppercase: true,
        numbers: true,
        specialCharacters: true,
      );

      expect(rule.isValid('Password1!'), isTrue);
      expect(rule.isValid('Secure123#'), isTrue);
    });

    test('should return false for an invalid password', () {
      final rule = Password(
        min: 8,
        lowercase: true,
        uppercase: true,
        numbers: true,
        specialCharacters: true,
      );

      // missing uppercase and special character
      expect(rule.isValid('password'), isFalse);

      // missing lowercase, uppercase, and special character
      expect(rule.isValid('12345678'), isFalse);

      // below minimum length
      expect(rule.isValid('Pass1!'), isFalse);
    });

    test('should return false for an empty password', () {
      final rule = Password();

      expect(rule.isValid(''), isFalse);
    });
  });
}
