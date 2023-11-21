import 'package:validation_form/src/rules/rule.dart';

class IsHexColor extends Rule {
  @override
  bool isValid(String value) {
    return RegExp(
      r'^#(?:(?:[0-9a-f]{3}){1,2}|(?:[0-9a-f]{4}){1,2})$',
      caseSensitive: false,
    ).hasMatch(value);
  }

  @override
  String get name => ValidationNames.mustBeHexColor;
}
