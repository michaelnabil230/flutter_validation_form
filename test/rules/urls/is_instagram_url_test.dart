import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsInstagramUrl', () {
    test('should return true if the URL is a valid Instagram URL', () {
      final rule = Validations.isInstagramUrl..attribute = 'link';

      expect(rule.isValid('https://instagram.com'), isTrue);
      expect(rule.isValid('https://www.instagram.com'), isTrue);
      expect(rule.isValid('https://www.instagram.com/user123'), isTrue);
      expect(rule.error, 'The link field must be a valid Instagram URL.');
    });

    test('should return false if the URL is not a valid Instagram URL', () {
      final rule = Validations.isInstagramUrl;

      expect(rule.isValid('https://www.google.com'), isFalse);
      expect(rule.isValid('https://www.example.com'), isFalse);
    });
  });
}
