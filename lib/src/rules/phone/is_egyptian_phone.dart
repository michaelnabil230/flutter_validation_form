import 'package:validation_form/src/rules/rule.dart';

class IsEgyptianPhone extends Rule {
  @override
  bool isValid(String value) => RegExp('^01[0125][0-9]{8}\$').hasMatch(value);

  @override
  String get name => ValidationNames.isEgyptianPhone;
}
