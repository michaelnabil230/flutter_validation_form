import 'package:validation_form/src/rules/rule.dart';

class Uppercase extends Rule {
  @override
  bool isValid(String value) => RegExp(r'[A-Z]').hasMatch(value);

  @override
  String get name => ValidationNames.uppercase;
}
