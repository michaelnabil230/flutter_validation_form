import 'package:validation_form/src/rules/rule.dart';

class Sometimes extends Rule {
  @override
  bool isValid(String value) => true;

  @override
  String get name => throw Exception('This rules can not show errors');
}
