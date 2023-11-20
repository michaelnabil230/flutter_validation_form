import 'package:validation_form/src/rules/rule.dart';

class IsEmpty extends Rule {
  @override
  bool isValid(String value) => value.trim().isEmpty;

  @override
  String get name => ValidationNames.isEmpty;
}
