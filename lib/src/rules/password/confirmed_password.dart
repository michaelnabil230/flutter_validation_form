import 'package:validation_form/src/rules/index.dart';
import 'package:validation_form/src/rules/rule.dart';

class ConfirmedPassword extends Rule {
  final String other;

  ConfirmedPassword(this.other);

  @override
  bool isValid(String value) => Same(other).isValid(value);

  @override
  String get name => ValidationNames.confirmedPassword;
}
