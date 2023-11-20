import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('RequiredWhen', () {
    test(
        'isValid should return true when boolean is true and value is not empty',
        () {
      final rule = RequiredWhen(boolean: true);
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('isValid should return false when boolean is true and value is empty',
        () {
      final rule = RequiredWhen(boolean: true);
      expect(rule.isValid(''), isFalse);
    });

    test('isValid should return true when boolean is false and value is empty',
        () {
      final rule = RequiredWhen(boolean: false);
      expect(rule.isValid(''), isTrue);
    });

    test(
        'isValid should return true when boolean is false and value is not empty',
        () {
      final rule = RequiredWhen(boolean: false);
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('error should return "required_when"', () {
      final rule = RequiredWhen(boolean: true);
      expect(rule.name, 'required_when');
    });
  });
}
