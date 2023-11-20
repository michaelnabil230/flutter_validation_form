import 'package:validation_form/src/rules/rule.dart';

class NotContains extends Rule {
  final String other;

  NotContains(this.other);

  @override
  bool isValid(String value) => !value.trim().contains(other);

  @override
  String get name => ValidationNames.notContains;
}
