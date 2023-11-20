import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('Required', () {
    test('returns true for non-empty string', () {
      final rule = Required();
      final isValid = rule.isValid('hello');
      expect(isValid, isTrue);
    });

    test('returns false for empty string', () {
      final rule = Required();
      final isValid = rule.isValid('');
      expect(isValid, isFalse);
    });

    test('returns false for string with only whitespace characters', () {
      final rule = Required();
      final isValid = rule.isValid('   ');
      expect(isValid, isFalse);
    });

    test('returns false for string with leading or trailing whitespace', () {
      final rule = Required();
      final isValid = rule.isValid('  hello  ');
      expect(isValid, isTrue);
    });
  });
}
