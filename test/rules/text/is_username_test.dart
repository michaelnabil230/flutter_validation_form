import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsUserName', () {
    test('should return true if the input is a valid username', () {
      final rule = Validations.isUserName;

      expect(rule.isValid('john_doe'), isTrue);
      expect(rule.isValid('johndoe123'), isTrue);
      expect(rule.isValid('j_doe'), isTrue);
    });

    test('should return false if the input is not a valid username', () {
      final rule = Validations.isUserName;

      expect(rule.isValid('john doe'), isFalse);
      expect(rule.isValid('john!doe'), isFalse);
      expect(rule.isValid('johndoe1234567890'), isFalse);
      expect(rule.isValid('jd'), isFalse);
    });
  });
}
