import 'package:validation_form/src/rules/rule.dart';

class IsNumber extends Rule {
  IsNumber();

  @override
  bool isValid(String value) => num.tryParse(value) != null;

  @override
  String get name => ValidationNames.mustBeInt;
}
