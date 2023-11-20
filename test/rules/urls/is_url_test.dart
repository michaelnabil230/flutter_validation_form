import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/urls/is_url.dart';

void main() {
  group('IsUrl', () {
    test('should return true if the input is a valid URL', () {
      final rule = IsUrl();

      expect(rule.isValid('https://www.example.com'), isTrue);
      expect(rule.isValid('http://www.example.com'), isTrue);
      expect(rule.isValid('https://example.com'), isTrue);
      expect(rule.isValid('http://example.com'), isTrue);
    });

    test('should return false if the input is not a valid URL', () {
      final rule = IsUrl();

      expect(rule.isValid('example.com'), isFalse);
      expect(rule.isValid('www.example.com'), isFalse);
      expect(rule.isValid('http:/www.example.com'), isFalse);
      expect(rule.isValid('htt://www.example.com'), isFalse);
      expect(rule.isValid('http://www'), isFalse);
    });
  });
}
