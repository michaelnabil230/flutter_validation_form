import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('RequiredWhen', () {
    test(
        'isValid should return true when boolean is true and value is not empty',
        () {
      final rule =
          RequiredWhen(condition: true, conditionName: 'When user is admin');
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('isValid should return false when boolean is true and value is empty',
        () {
      final rule =
          RequiredWhen(condition: true, conditionName: 'When user is admin');
      expect(rule.isValid(''), isFalse);
    });

    test('isValid should return true when boolean is false and value is empty',
        () {
      final rule =
          RequiredWhen(condition: false, conditionName: 'When user is admin');
      expect(rule.isValid(''), isTrue);
    });

    test(
        'isValid should return true when boolean is false and value is not empty',
        () {
      final rule =
          RequiredWhen(condition: false, conditionName: 'When user is admin');
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('error should return "required_when"', () {
      final rule =
          RequiredWhen(condition: true, conditionName: 'When user is admin');
      expect(rule.name, 'required_when');
    });
  });
}
