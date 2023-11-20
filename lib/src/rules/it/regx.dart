import 'package:validation_form/src/rules/rule.dart';

class RegExpRule extends Rule {
  final RegExp regX;

  RegExpRule(this.regX);

  @override
  bool isValid(String value) => regX.hasMatch(value);

  @override
  String get name => ValidationNames.isNotValid;
}
