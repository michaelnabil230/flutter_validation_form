import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('IsRtl', () {
    test('should return true if value is in a RTL language', () {
      final rule = IsRtl();

      expect(rule.isValid('عربي'), isTrue);
      expect(rule.isValid('١٢٣'), isTrue);
    });

    test('should return false if value is not in a RTL language', () {
      final rule = IsRtl();

      expect(rule.isValid('English'), isFalse);
      expect(rule.isValid('123'), isFalse);
    });

    test('should return false if value is empty', () {
      final rule = IsRtl();

      expect(rule.isValid(''), isFalse);
    });
  });
}
