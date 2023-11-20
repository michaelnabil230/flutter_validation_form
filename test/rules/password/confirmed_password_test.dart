import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/index.dart';

void main() {
  group('ConfirmedPassword', () {
    test('should return true if the password matches the confirmed password',
        () {
      final rule = ConfirmedPassword('Password123');
      expect(rule.isValid('Password123'), isTrue);
    });

    test(
        'should return false if the password does not match the confirmed password',
        () {
      final rule = ConfirmedPassword('password***');
      expect(rule.isValid('Password456'), isFalse);
    });
  });
}
