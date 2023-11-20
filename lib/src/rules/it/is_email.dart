import 'package:email_validator/email_validator.dart';
import 'package:validation_form/src/rules/rule.dart';

class IsEmail extends Rule {
  IsEmail();

  @override
  bool isValid(String value) => EmailValidator.validate(value);

  @override
  String get name => ValidationNames.isNotEmailAddress;
}
