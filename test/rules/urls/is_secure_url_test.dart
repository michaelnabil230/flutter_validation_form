import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsSecureUrl', () {
    test('should return true if the URL starts with "https://"', () {
      final rule = Validations.isSecureUrl..attribute = 'link';

      expect(rule.isValid('https://example.com'), isTrue);
      expect(rule.error, 'The link field must be a secure URL (https).');
    });

    test('should return false if the URL does not start with "https://"', () {
      final rule = Validations.isSecureUrl;

      expect(rule.isValid('http://example.com'), isFalse);
    });
  });
}
