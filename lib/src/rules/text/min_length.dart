import 'package:validation_form/src/rules/rule.dart';

class MinLength extends Rule {
  final int min;

  MinLength(this.min);

  @override
  bool isValid(String value) => value.trim().length >= min;

  @override
  String get name => ValidationNames.min;

  @override
  List<Object> get parameters => [min];
}
