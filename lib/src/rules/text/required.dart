import 'package:validation_form/src/rules/rule.dart';

class Required extends Rule {
  @override
  bool isValid(String value) => value.trim().isNotEmpty;

  @override
  String get name => ValidationNames.required;
}
