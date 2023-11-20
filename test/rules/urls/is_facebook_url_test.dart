import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsFacebookUrl', () {
    test('should return true if the URL is a valid Facebook URL', () {
      final rule = Validations.isFacebookUrl..attribute = 'link';

      expect(rule.isValid('https://facebook.com'), isTrue);
      expect(rule.isValid('https://www.facebook.com'), isTrue);
      expect(rule.isValid('https://www.facebook.com/user123'), isTrue);
      expect(rule.isValid('http://www.facebook.com/user123'), isTrue);
      expect(rule.isValid('https://facebook.com/user123'), isTrue);
      expect(rule.isValid('http://facebook.com/user123'), isTrue);
      expect(rule.error, 'The link field must be a valid Facebook URL.');
    });

    test('should return false if the URL is not a valid Facebook URL', () {
      final rule = Validations.isFacebookUrl;

      expect(rule.isValid('https://www.google.com'), isFalse);
      expect(rule.isValid('https://www.example.com'), isFalse);
    });
  });
}
