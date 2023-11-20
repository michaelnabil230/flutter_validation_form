import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('NotContainsAny', () {
    test(
        'should return true if value does not contain any of the specified strings',
        () {
      final rule = Validations.notContainsAny(['foo', 'bar', 'baz']);

      expect(rule.isValid('hello world'), isTrue);
      expect(rule.isValid('testing'), isTrue);
      expect(rule.isValid('qux'), isTrue);
    });

    test('should return false if value contains any of the specified strings',
        () {
      final rule = Validations.notContainsAny(['foo', 'bar', 'baz']);

      expect(rule.isValid('hello foo world'), isFalse);
      expect(rule.isValid('testing bar'), isFalse);
      expect(rule.isValid('bazbazbaz'), isFalse);
    });
  });
}
