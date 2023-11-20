import 'package:validation_form/src/rules/rule.dart';

class IsSecureUrl extends Rule {
  @override
  bool isValid(String value) {
    String url = value.toLowerCase();

    return url.startsWith('https://');
  }

  @override
  String get name => ValidationNames.isNotSecureUrl;
}
