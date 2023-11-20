import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/urls/is_secure_url.dart';

void main() {
  group('IsSecureUrl', () {
    test('should return true if the URL starts with "https://"', () {
      final rule = IsSecureUrl();

      expect(rule.isValid('https://example.com'), isTrue);
    });

    test('should return false if the URL does not start with "https://"', () {
      final rule = IsSecureUrl();

      expect(rule.isValid('http://example.com'), isFalse);
    });
  });
}
