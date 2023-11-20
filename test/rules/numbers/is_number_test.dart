import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('IsNumber', () {
    test('should return true if value is a valid number', () {
      final rule = IsNumber();

      expect(rule.isValid('123'), isTrue);
      expect(rule.isValid('3.14'), isTrue);
      expect(rule.isValid('-10'), isTrue);
    });

    test('should return false if value is not a valid number', () {
      final rule = IsNumber();

      expect(rule.isValid('not_a_number'), isFalse);
      expect(rule.isValid('1.23.45'), isFalse);
      expect(rule.isValid('abc'), isFalse);
    });
  });
}
