import 'package:validation_form/src/rules/rule.dart';

class IsDecimal extends Rule {
  @override
  bool isValid(String value) => double.tryParse(value) != null;

  @override
  String get name => ValidationNames.isDecimal;
}
