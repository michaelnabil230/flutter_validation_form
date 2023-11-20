import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('ConfirmedPassword', () {
    test('should return true if the password matches the confirmed password',
        () {
      final rule = Validations.confirmedPassword('Password123');
      expect(rule.isValid('Password123'), isTrue);
    });

    test(
        'should return false if the password does not match the confirmed password',
        () {
      final rule = Validations.confirmedPassword('password***');
      expect(rule.isValid('Password456'), isFalse);
    });
  });
}
