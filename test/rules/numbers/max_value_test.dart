import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('MaxValue', () {
    test('should return true if value is less than or equal to max', () {
      final rule = MaxValue(100);

      expect(rule.isValid('50'), isTrue);
      expect(rule.isValid('100'), isTrue);
    });

    test('should return false if value is greater than max', () {
      final rule = MaxValue(100);

      expect(rule.isValid('150'), isFalse);
      expect(rule.isValid('200'), isFalse);
    });

    test('should return false if value is not a valid number', () {
      final rule = MaxValue(100);

      expect(rule.isValid('not_a_number'), isFalse);
      expect(rule.isValid('abc'), isFalse);
    });
  });
}
