import 'package:validation_form/src/rules/rule.dart';

class IsBoolean extends Rule {
  @override
  bool isValid(String value) {
    return ['true', 'false', '0', '1']
        .any((e) => e.compareTo(value.trim().toLowerCase()) == 0);
  }

  @override
  String get name => ValidationNames.isNotBool;
}
