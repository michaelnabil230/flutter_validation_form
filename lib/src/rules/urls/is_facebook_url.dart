import 'package:validation_form/src/rules/rule.dart';

class IsFacebookUrl extends Rule {
  IsFacebookUrl();

  @override
  bool isValid(String value) {
    return RegExp(
      r'^((https?):\/\/)((www\.)?(facebook|fb)\.(com))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    ).hasMatch(value);
  }

  @override
  String get name => ValidationNames.notValidFacebookUrl;
}
