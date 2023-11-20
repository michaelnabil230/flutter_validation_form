import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('Same', () {
    test('should return true if the input is the same as the specified value',
        () {
      final rule = Same('password123');

      expect(rule.isValid('password123'), isTrue);
      expect(rule.isValid('password'), isFalse);
      expect(rule.isValid('PASSWORD123'), isFalse);
    });

    test(
        'should return false if the input is not the same as the specified value',
        () {
      final rule = Same('hello');

      expect(rule.isValid('hello'), isTrue);
      expect(rule.isValid('goodbye'), isFalse);
      expect(rule.isValid('HELLO'), isFalse);
    });
  });
}
