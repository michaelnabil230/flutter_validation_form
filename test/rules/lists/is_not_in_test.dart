import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsNotIn', () {
    test('should return true if value is not in the specified list', () {
      final rule = Validations.isNotIn(['foo', 'bar', 'baz']);

      expect(rule.isValid('hello'), isTrue);
      expect(rule.isValid('world'), isTrue);
      expect(rule.isValid('qux'), isTrue);
    });

    test('should return false if value is in the specified list', () {
      final rule = Validations.isNotIn(['foo', 'bar', 'baz']);

      expect(rule.isValid('foo'), isFalse);
      expect(rule.isValid('bar'), isFalse);
      expect(rule.isValid('baz'), isFalse);
    });
  });
}
