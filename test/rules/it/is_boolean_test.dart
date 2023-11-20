import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsBool', () {
    test('should return true for valid boolean values', () {
      final rule = Validations.isBoolean;

      expect(rule.isValid('true'), isTrue);
      expect(rule.isValid('false'), isTrue);
      expect(rule.isValid('0'), isTrue);
      expect(rule.isValid('1'), isTrue);
      expect(rule.isValid('True'), isTrue);
      expect(rule.isValid('False'), isTrue);
      expect(rule.isValid('tRuE'), isTrue);
      expect(rule.isValid('fAlsE'), isTrue);
      expect(rule.isValid(' 0 '), isTrue);
      expect(rule.isValid(' 1 '), isTrue);
    });

    test('should return false for invalid boolean values', () {
      final rule = Validations.isBoolean;

      expect(rule.isValid(''), isFalse);
      expect(rule.isValid('notabool'), isFalse);
      expect(rule.isValid('2'), isFalse);
      expect(rule.isValid('yes'), isFalse);
      expect(rule.isValid('no'), isFalse);
      expect(rule.isValid('null'), isFalse);
    });
  });
}
