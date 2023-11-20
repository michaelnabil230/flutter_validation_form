import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('IsDate', () {
    test('should return true if value is a valid date', () {
      final rule = IsDate();

      expect(rule.isValid('2022-01-01'), isTrue);
      expect(rule.isValid('2023-05-10'), isTrue);
      expect(rule.isValid('1999-12-31'), isTrue);
    });

    test('should return false if value is not a valid date', () {
      final rule = IsDate();

      expect(rule.isValid('not_a_date'), isFalse);
      expect(rule.isValid('not a date'), isFalse);
    });
  });
}
