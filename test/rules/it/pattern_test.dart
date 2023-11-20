import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('PatternRule', () {
    test('should return true for valid values matching the regex', () {
      final regex = RegExp(r'^[A-Za-z]+$');
      final rule = PatternRule(regex);

      expect(rule.isValid('abc'), isTrue);
      expect(rule.isValid('XYZ'), isTrue);
      expect(rule.isValid('Hello'), isTrue);
    });

    test('should return false for invalid values not matching the regex', () {
      final regex = RegExp(r'^[A-Za-z]+$');
      final rule = PatternRule(regex);

      expect(rule.isValid('123'), isFalse);
      expect(rule.isValid('abc123'), isFalse);
      expect(rule.isValid('Hello123'), isFalse);
      expect(rule.isValid(' '), isFalse);
    });
  });
}
