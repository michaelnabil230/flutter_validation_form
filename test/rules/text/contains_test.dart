import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('Contains', () {
    test('should return true if the input contains the specified substring',
        () {
      final rule = Contains('world');

      expect(rule.isValid('hello world'), isTrue);
      expect(rule.isValid('goodbye world'), isTrue);
      expect(rule.isValid('hello, world!'), isTrue);
    });

    test(
        'should return false if the input does not contain the specified substring',
        () {
      final rule = Contains('world');

      expect(rule.isValid('hello'), isFalse);
      expect(rule.isValid('goodbye'), isFalse);
      expect(rule.isValid('hi'), isFalse);
    });
  });
}
