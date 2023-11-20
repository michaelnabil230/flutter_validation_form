import 'package:validation_form/src/rules/rule.dart';

class IsSecureUrl extends Rule {
  @override
  bool isValid(String value) => value.toLowerCase().startsWith('https://');

  @override
  String get name => ValidationNames.isNotSecureUrl;
}
