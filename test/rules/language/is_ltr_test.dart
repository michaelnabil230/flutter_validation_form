import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('IsLtr', () {
    test('should return true if value is not in a RTL language', () {
      final rule = IsLtr();

      expect(rule.isValid('English'), isTrue);
      expect(rule.isValid('123'), isTrue);
    });

    test('should return false if value is in a RTL language', () {
      final rule = IsLtr();

      expect(rule.isValid('عربي'), isFalse);
      expect(rule.isValid('١٢٣'), isFalse);
    });

    test('should return false if value is empty', () {
      final rule = IsLtr();

      expect(rule.isValid(''), isFalse);
    });
  });
}
