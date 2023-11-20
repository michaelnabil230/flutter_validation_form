import 'package:validation_form/src/rules/rule.dart';

class Contains extends Rule {
  final String other;

  Contains(this.other);

  @override
  bool isValid(String value) => value.trim().contains(other);

  @override
  String get name => ValidationNames.isItContains;

  @override
  List get parameters => [other];
}
