import 'package:flutter_test/flutter_test.dart' hide isNotEmpty;
import 'package:validation_form/validation_form.dart';

void main() {
  group('Uppercase', () {
    test(
        'should return true if the input contains at least one uppercase letter',
        () {
      final rule = Validations.uppercase;

      expect(rule.isValid('HELLO'), isTrue);
      expect(rule.isValid('GOODBYE'), isTrue);
      expect(rule.isValid('Hi'), isTrue);
    });

    test(
        'should return false if the input does not contain any uppercase letters',
        () {
      final rule = Validations.uppercase;

      expect(rule.isValid('hello'), isFalse);
      expect(rule.isValid('goodbye'), isFalse);
      expect(rule.isValid('123'), isFalse);
    });
  });
}
