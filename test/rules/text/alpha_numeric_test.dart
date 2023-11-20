import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('AlphaNumeric', () {
    test('should return true if the input is alphanumeric', () {
      final rule = AlphaNumeric();

      expect(rule.isValid('abc123'), isTrue);
      expect(rule.isValid('AbCdEfG123'), isTrue);
      expect(rule.isValid('1234567890'), isTrue);
    });

    test('should return false if the input is not alphanumeric', () {
      final rule = AlphaNumeric();

      expect(rule.isValid('abc 123'), isFalse);
      expect(rule.isValid('!@#'), isFalse);
      expect(rule.isValid('abc-123'), isFalse);
    });
  });
}
