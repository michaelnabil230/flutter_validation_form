import 'package:validation_form/src/rules/rule.dart';
import 'package:validation_form/src/rules/text/lowercase.dart';
import 'package:validation_form/src/rules/text/min_length.dart';
import 'package:validation_form/src/rules/text/uppercase.dart';

class Password extends Rule {
  final int min;

  final bool lowercase;

  final bool uppercase;

  final bool numbers;

  final bool specialCharacters;

  Password({
    this.min = 8,
    this.lowercase = false,
    this.uppercase = false,
    this.numbers = false,
    this.specialCharacters = false,
  });

  late String _message;

  late List _parameters = [];

  @override
  bool isValid(String value) {
    if (!MinLength(min).isValid(value)) {
      _message = ValidationNames.passwordMin;
      _parameters = [min];
      return false;
    }

    if (lowercase && !Lowercase().isValid(value)) {
      _message = ValidationNames.passwordLowercase;
      return false;
    }

    if (uppercase && !Uppercase().isValid(value)) {
      _message = ValidationNames.passwordUppercase;
      return false;
    }

    if (specialCharacters &&
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      _message = ValidationNames.passwordSpecialCharacters;
      return false;
    }

    if (numbers && !RegExp('[0-9]').hasMatch(value)) {
      _message = ValidationNames.passwordNumbers;
      return false;
    }

    return true;
  }

  @override
  String get name => _message;

  @override
  List get parameters => _parameters;
}
