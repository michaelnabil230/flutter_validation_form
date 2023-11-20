import 'package:validation_form/src/rules/rule.dart';

class AlphaNumeric extends Rule {
  AlphaNumeric();

  @override
  bool isValid(String value) => RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value);

  @override
  String get name => ValidationNames.alphaNumeric;
}
