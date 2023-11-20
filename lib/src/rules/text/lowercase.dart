import 'package:validation_form/src/rules/rule.dart';

class Lowercase extends Rule {
  @override
  bool isValid(String value) => RegExp(r'[a-z]').hasMatch(value);

  @override
  String get name => ValidationNames.lowercase;
}
