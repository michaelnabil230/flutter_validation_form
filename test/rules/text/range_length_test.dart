import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('RangeLength', () {
    test('should return true if the input length is within the specified range',
        () {
      final rule = RangeLength(min: 3, max: 6);

      expect(rule.isValid('abc'), isTrue);
      expect(rule.isValid('hello'), isTrue);
      expect(rule.isValid('world'), isTrue);
      expect(rule.isValid('hi'), isFalse);
      expect(rule.isValid('longer string'), isFalse);
    });

    test(
        'should return false if the input length is outside the specified range',
        () {
      final rule = RangeLength(min: 10, max: 20);

      expect(rule.isValid('hello'), isFalse);
      expect(rule.isValid('goodbye'), isFalse);
      expect(rule.isValid('hiiiiiiiii'), isTrue);
      expect(rule.isValid('longer string'), isTrue);
    });
  });
}
