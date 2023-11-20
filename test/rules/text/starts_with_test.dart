import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('StartsWith', () {
    test('should return true if the input starts with the specified pattern',
        () {
      final rule = StartsWith('hello');

      expect(rule.isValid('hello world'), isTrue);
      expect(rule.isValid('hello, how are you?'), isTrue);
      expect(rule.isValid('hello123'), isTrue);
    });

    test(
        'should return false if the input does not start with the specified pattern',
        () {
      final rule = StartsWith('hello');

      expect(rule.isValid('world hello'), isFalse);
      expect(rule.isValid('hi'), isFalse);
      expect(rule.isValid('123hello'), isFalse);
    });
  });
}
