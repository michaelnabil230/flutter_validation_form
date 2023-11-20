import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('Sometimes', () {
    test('should always return true', () {
      final rule = Sometimes();

      expect(rule.isValid('any value'), isTrue);
      expect(rule.isValid(''), isTrue);
      expect(rule.isValid('123'), isTrue);
    });

    test('should throw an exception when calling toString()', () {
      final rule = Sometimes();

      expect(() => rule.error, throwsException);
    });
  });
}
