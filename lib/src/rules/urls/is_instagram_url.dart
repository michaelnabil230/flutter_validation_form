import 'package:validation_form/src/rules/rule.dart';

class IsInstagramUrl extends Rule {
  @override
  bool isValid(String value) {
    return RegExp(
      r'^((https?):\/\/)((www\.)?(instagram)\.(com))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    ).hasMatch(value);
  }

  @override
  String get name => ValidationNames.notValidInstagramUrl;
}
