import 'package:validation_form/src/rules/rule.dart';

class IsHexColor extends Rule {
  @override
  bool isValid(String value) =>
      RegExp(r'^#(?:[0-9a-fA-F]{3}){1,2}$').hasMatch(value);

  @override
  String get name => ValidationNames.mustBeHexColor;
}
