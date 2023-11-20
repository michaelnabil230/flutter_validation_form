import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/rule.dart';

class TestRule extends Rule {
  @override
  bool isValid(String input) => input.isNotEmpty;

  @override
  String get name => 'test_rule';
}

void main() {
  group('TestRule', () {
    test('should return true if the input is not empty', () {
      final rule = TestRule()..initialization('field');

      expect(rule.isValid('hello'), isTrue);
      expect(rule.isValid('123'), isTrue);
      expect(rule.isValid(' '), isTrue);
    });

    test('should return false if the input is empty', () {
      final rule = TestRule()..initialization('field');

      expect(rule.isValid(''), isFalse);
    });

    test('test custom error', () {
      final rule = TestRule()
        ..initialization('field')
        ..customValidationMessage =
            (String attribute, [List? _]) => 'This is custom error';

      expect(rule.error, 'This is custom error');
    });
  });
}
