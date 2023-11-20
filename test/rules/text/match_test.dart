import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('Match', () {
    test('returns true for matching strings with default case sensitivity', () {
      final rule = Match('hello');
      final isValid = rule.isValid('hello');
      expect(isValid, true);
    });

    test('returns false for non-matching strings with default case sensitivity',
        () {
      final rule = Match('hello');
      final isValid = rule.isValid('world');
      expect(isValid, false);
    });

    test('returns true for matching strings with case sensitivity', () {
      final rule = Match('Hello', caseSensitive: true);
      final isValid = rule.isValid('Hello');
      expect(isValid, true);
    });

    test('returns false for non-matching strings with case sensitivity', () {
      final rule = Match('Hello', caseSensitive: true);
      final isValid = rule.isValid('hello');
      expect(isValid, false);
    });

    test('returns true for matching strings without case sensitivity', () {
      final rule = Match('Hello', caseSensitive: false);
      final isValid = rule.isValid('hello');
      expect(isValid, true);
    });

    test('returns false for non-matching strings without case sensitivity', () {
      final rule = Match('Hello', caseSensitive: false);
      final isValid = rule.isValid('world');
      expect(isValid, false);
    });
  });
}
