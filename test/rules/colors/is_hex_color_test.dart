import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsHexColor', () {
    test('should return true if value is a valid hex color code', () {
      final rule = Validations.isHexColor;

      expect(rule.isValid('#FFF'), isTrue);
      expect(rule.isValid('#FFFF'), isTrue);
      expect(rule.isValid('#ffffff'), isTrue);
      expect(rule.isValid('#FF000080'), isTrue);
      expect(rule.isValid('#123456'), isTrue);
      expect(rule.isValid('#ABCDEF'), isTrue);
    });

    test('should return false if value is not a valid hex color code', () {
      final rule = Validations.isHexColor;

      expect(rule.isValid('#GGG'), isFalse);
      expect(rule.isValid('#GGGGGGG'), isFalse);
      expect(rule.isValid('#FFGG00FF'), isFalse);
      expect(rule.isValid('#123AB'), isFalse);
      expect(rule.isValid('#12345'), isFalse);
      expect(rule.isValid('#1234567'), isFalse);
      expect(rule.isValid('red'), isFalse);
      expect(rule.isValid('#abcdefg'), isFalse);
    });
  });
}
