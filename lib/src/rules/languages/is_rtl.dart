import 'package:validation_form/src/rules/rule.dart';

class IsRtl extends Rule {
  @override
  bool isValid(String value) {
    return RegExp(r'[\u04c7-\u0591\u05D0-\u05EA\u05F0-\u05F4\u0600-\u06FF]')
        .hasMatch(value);
  }

  @override
  String get name => ValidationNames.mustBeArabic;
}
