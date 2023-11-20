import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/urls/is_instagram_url.dart';

void main() {
  group('IsInstagramUrl', () {
    test('should return true if the URL is a valid Instagram URL', () {
      final rule = IsInstagramUrl();

      expect(rule.isValid('https://instagram.com'), isTrue);
      expect(rule.isValid('https://www.instagram.com'), isTrue);
      expect(rule.isValid('https://www.instagram.com/user123'), isTrue);
      expect(rule.isValid('http://www.instagram.com/user123'), isTrue);
      expect(rule.isValid('https://instagram.com/user123'), isTrue);
      expect(rule.isValid('http://instagram.com/user123'), isTrue);
    });

    test('should return false if the URL is not a valid Instagram URL', () {
      final rule = IsInstagramUrl();

      expect(rule.isValid('https://www.google.com'), isFalse);
      expect(rule.isValid('https://www.example.com'), isFalse);
    });
  });
}
