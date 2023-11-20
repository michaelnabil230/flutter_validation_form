import 'package:validation_form/src/rules/rule.dart';

class MaxLength extends Rule {
  final int max;

  MaxLength(this.max);

  @override
  bool isValid(String value) => value.trim().length <= max;

  @override
  String get name => ValidationNames.max;

  @override
  List<Object> get parameters => [max];
}
