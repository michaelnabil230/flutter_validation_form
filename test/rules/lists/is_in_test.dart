import 'package:flutter_test/flutter_test.dart' hide isIn;
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsIn', () {
    test('should return true if value is in the specified list', () {
      final rule = Validations.isIn(['foo', 'bar', 'baz']);

      expect(rule.isValid('foo'), isTrue);
      expect(rule.isValid('bar'), isTrue);
      expect(rule.isValid('baz'), isTrue);
    });

    test('should return false if value is not in the specified list', () {
      final rule = Validations.isIn(['foo', 'bar', 'baz']);

      expect(rule.isValid('hello'), isFalse);
      expect(rule.isValid('world'), isFalse);
      expect(rule.isValid('qux'), isFalse);
    });
  });

  group('isIn', () {
    test('should return true if value is in the specified list', () {
      expect(isIn('foo', ['foo', 'bar', 'baz']), isTrue);
      expect(isIn('bar', ['foo', 'bar', 'baz']), isTrue);
      expect(isIn('baz', ['foo', 'bar', 'baz']), isTrue);
    });

    test('should return false if value is not in the specified list', () {
      expect(isIn('hello', ['foo', 'bar', 'baz']), isFalse);
      expect(isIn('world', ['foo', 'bar', 'baz']), isFalse);
      expect(isIn('qux', ['foo', 'bar', 'baz']), isFalse);
    });
  });
}
