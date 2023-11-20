import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsUrl', () {
    test('should return true if the input is a valid URL', () {
      final rule = Validations.isUrl..attribute = 'link';

      expect(rule.isValid('https://www.example.com'), isTrue);
      expect(rule.isValid('http://www.example.com'), isTrue);
      expect(rule.isValid('https://example.com'), isTrue);
      expect(rule.isValid('http://example.com'), isTrue);
      expect(rule.error, 'The link field must be a valid URL.');
    });

    test('should return false if the input is not a valid URL', () {
      final rule = Validations.isUrl;

      expect(rule.isValid('example.com'), isFalse);
      expect(rule.isValid('www.example.com'), isFalse);
      expect(rule.isValid('http:/www.example.com'), isFalse);
      expect(rule.isValid('htt://www.example.com'), isFalse);
      expect(rule.isValid('http://www'), isFalse);
    });
  });
}
