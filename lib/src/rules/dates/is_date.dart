import 'package:validation_form/src/rules/rule.dart';

class IsDate extends Rule {
  IsDate();

  @override
  bool isValid(String value) => DateTime.tryParse(value) != null;

  @override
  String get name => ValidationNames.isNotDateFormat;
}
