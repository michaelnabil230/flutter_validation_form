import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('IsIpAddress', () {
    test('should return true for valid IP addresses', () {
      final rule = Validations.isIpAddress;

      expect(rule.isValid('192.168.0.1'), isTrue);
      expect(rule.isValid('10.0.0.1'), isTrue);
      expect(rule.isValid('172.16.0.1'), isTrue);
      expect(rule.isValid('0.0.0.0'), isTrue);
      expect(rule.isValid('255.255.255.255'), isTrue);
    });

    test('should return false for invalid IP addresses', () {
      final rule = Validations.isIpAddress;

      expect(rule.isValid(''), isFalse);
      expect(rule.isValid('notanipaddress'), isFalse);
      expect(rule.isValid('192.168.0'), isFalse);
      expect(rule.isValid('192.168.0.256'), isFalse);
      expect(rule.isValid('192.168.0.1.1'), isFalse);
      expect(rule.isValid('192.168.0.-1'), isFalse);
    });
  });
}
