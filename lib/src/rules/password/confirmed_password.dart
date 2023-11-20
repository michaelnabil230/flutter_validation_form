import 'package:validation_form/validation_form.dart';

class ConfirmedPassword extends Rule {
  final String other;

  ConfirmedPassword(this.other);

  @override
  bool isValid(String value) => Same(other).isValid(value);

  @override
  String get name => ValidationNames.confirmedPassword;
}
