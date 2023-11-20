import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('IsPort', () {
    test('should return true for valid ports', () {
      final rule = IsPort();

      expect(rule.isValid('0'), isTrue);
      expect(rule.isValid('80'), isTrue);
      expect(rule.isValid('443'), isTrue);
      expect(rule.isValid('8080'), isTrue);
      expect(rule.isValid('65535'), isTrue);
    });

    test('should return false for invalid ports', () {
      final rule = IsPort();

      expect(rule.isValid(''), isFalse);
      expect(rule.isValid('notaport'), isFalse);
      expect(rule.isValid('-1'), isFalse);
      expect(rule.isValid('65536'), isFalse);
      expect(rule.isValid('10.0.0.1'), isFalse);
    });
  });
}
