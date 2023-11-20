import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsYoutubeUrl', () {
    test('should return true if the input is a valid YouTube URL', () {
      final rule = Validations.isYoutubeUrl..attribute = 'link';

      expect(
          rule.isValid('https://www.youtube.com/watch?v=abcdefghijk'), isTrue);
      expect(rule.isValid('https://youtube.com/watch?v=abcdefghijk'), isTrue);
      expect(rule.isValid('https://www.youtube.com/embed/abcdefghijk'), isTrue);
      expect(rule.isValid('https://m.youtube.com/v/abcdefghijk'), isTrue);
      expect(rule.error, 'The link field must be a valid YouTube URL.');
    });

    test('should return false if the input is not a valid YouTube URL', () {
      final rule = Validations.isYoutubeUrl;

      expect(rule.isValid('https://www.example.com'), isFalse);
      expect(rule.isValid('https://www.facebook.com'), isFalse);
    });
  });
}
