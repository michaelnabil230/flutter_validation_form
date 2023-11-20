import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('ContainsAny', () {
    test('should return true if value contains any of the specified strings',
        () {
      final rule = Validations.containsAny(['foo', 'bar', 'baz']);

      expect(rule.isValid('hello foo world'), isTrue);
      expect(rule.isValid('testing bar'), isTrue);
      expect(rule.isValid('bazbazbaz'), isTrue);
    });

    test(
        'should return false if value does not contain any of the specified strings',
        () {
      final rule = Validations.containsAny(['foo', 'bar', 'baz']);

      expect(rule.isValid('hello world'), isFalse);
      expect(rule.isValid('testing'), isFalse);
      expect(rule.isValid('qux'), isFalse);
    });

    test('should respect case sensitivity when specified', () {
      final rule = Validations.containsAny(['Foo', 'Bar', 'Baz'], caseSensitive: true);

      expect(rule.isValid('hello Foo world'), isTrue);
      expect(rule.isValid('testing Bar'), isTrue);
      expect(rule.isValid('bazbazbaz'), isFalse);
    });
  });

  group('containsAny', () {
    test('should return true if value contains any of the specified strings',
        () {
      expect(containsAny('hello foo world', ['foo', 'bar', 'baz']), isTrue);
      expect(containsAny('testing bar', ['foo', 'bar', 'baz']), isTrue);
      expect(containsAny('bazbazbaz', ['foo', 'bar', 'baz']), isTrue);
    });

    test(
        'should return false if value does not contain any of the specified strings',
        () {
      expect(containsAny('hello world', ['foo', 'bar', 'baz']), isFalse);
      expect(containsAny('testing', ['foo', 'bar', 'baz']), isFalse);
      expect(containsAny('qux', ['foo', 'bar', 'baz']), isFalse);
    });

    test('should respect case sensitivity when specified', () {
      expect(
          containsAny('hello Foo world', ['Foo', 'Bar', 'Baz'],
              caseSensitive: true),
          isTrue);
      expect(
          containsAny('testing Bar', ['Foo', 'Bar', 'Baz'],
              caseSensitive: true),
          isTrue);
      expect(
          containsAny('bazbazbaz', ['Foo', 'Bar', 'Baz'], caseSensitive: true),
          isFalse);
    });

    test('should trim values by default', () {
      expect(containsAny('  foo  ', ['foo']), isTrue);
      expect(containsAny(' bar ', ['bar']), isTrue);
      expect(containsAny('baz ', ['baz']), isTrue);
    });

    test('should not trim values when trim is set to false', () {
      const list = <String>['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'q'];
      expect(containsAny('JJJJ', list, trim: false), isFalse);
      expect(containsAny('kli', list, trim: false), isFalse);
      expect(containsAny('Row', list, trim: false), isFalse);
      expect(containsAny('rss', list, trim: false), isFalse);
      expect(containsAny('json', list, trim: false), isFalse);
    });
  });
}
