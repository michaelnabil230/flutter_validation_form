import 'package:validation_form/src/rules/rule.dart';

class IsIpAddress extends Rule {
  @override
  bool isValid(String value) {
    final ipParts = value.split('.');
    if (ipParts.length != 4) {
      return false;
    }
    bool isValid = true;
    for (final part in ipParts) {
      try {
        final int value = int.parse(part);
        if (value < 0 || value > 255) {
          isValid = false;
          break;
        }
      } catch (e) {
        isValid = false;
        break;
      }
    }
    return isValid;
  }

  @override
  String get name => ValidationNames.isIpAddress;
}
