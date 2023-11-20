import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/rules/it/is_ip_address.dart';

void main() {
  group('IsIpAddress', () {
    test('should return true for valid IP addresses', () {
      final rule = IsIpAddress();

      expect(rule.isValid('192.168.0.1'), isTrue);
      expect(rule.isValid('10.0.0.1'), isTrue);
      expect(rule.isValid('172.16.0.1'), isTrue);
      expect(rule.isValid('0.0.0.0'), isTrue);
      expect(rule.isValid('255.255.255.255'), isTrue);
    });

    test('should return false for invalid IP addresses', () {
      final rule = IsIpAddress();

      expect(rule.isValid(''), isFalse);
      expect(rule.isValid('notanipaddress'), isFalse);
      expect(rule.isValid('192.168.0'), isFalse);
      expect(rule.isValid('192.168.0.256'), isFalse);
      expect(rule.isValid('192.168.0.1.1'), isFalse);
      expect(rule.isValid('192.168.0.-1'), isFalse);
    });
  });
}
