import 'package:validation_form/src/rules/rule.dart';

class PatternRule extends Rule {
  final RegExp regExp;

  PatternRule(this.regExp);

  @override
  bool isValid(String value) => regExp.hasMatch(value);

  @override
  String get name => ValidationNames.pattern;
}
