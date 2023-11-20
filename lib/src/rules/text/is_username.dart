import 'package:validation_form/src/rules/rule.dart';

class IsUserName extends Rule {
  IsUserName();

  @override
  bool isValid(String value) => RegExp(r'^[a-zA-Z0-9_]{3,16}$').hasMatch(value);

  @override
  String get name => ValidationNames.username;
}
