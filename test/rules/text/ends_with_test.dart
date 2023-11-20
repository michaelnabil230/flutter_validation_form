import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('EndsWith', () {
    test('should return true if the input ends with the specified substring',
        () {
      final rule = EndsWith('.com');

      expect(rule.isValid('example.com'), isTrue);
      expect(rule.isValid('test.com'), isTrue);
      expect(rule.isValid('hello.com'), isTrue);
    });

    test(
        'should return false if the input does not end with the specified substring',
        () {
      final rule = EndsWith('.com');

      expect(rule.isValid('example.org'), isFalse);
      expect(rule.isValid('test.net'), isFalse);
      expect(rule.isValid('hello.io'), isFalse);
    });
  });
}
