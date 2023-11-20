import 'package:validation_form/src/rules/rule.dart';

class IsNumbersOnly extends Rule {
  IsNumbersOnly();

  @override
  bool isValid(String value) => int.tryParse(value) != null;

  @override
  String get name => ValidationNames.isNumbersOnly;
}
