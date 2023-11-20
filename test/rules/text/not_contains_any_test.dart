import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('NotContains', () {
    test(
        'should return true if the input does not contain the specified substring',
        () {
      final rule = NotContains('world');

      expect(rule.isValid('hello'), isTrue);
      expect(rule.isValid('goodbye'), isTrue);
      expect(rule.isValid('hi'), isTrue);
    });

    test('should return false if the input contains the specified substring',
        () {
      final rule = NotContains('world');

      expect(rule.isValid('hello world'), isFalse);
      expect(rule.isValid('goodbye world'), isFalse);
      expect(rule.isValid('hello, world!'), isFalse);
    });
  });
}
