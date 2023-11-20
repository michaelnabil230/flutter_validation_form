import 'package:validation_form/src/rules/rule.dart';

class MaxValue extends Rule {
  final int max;

  MaxValue(this.max);

  @override
  bool isValid(String value) {
    num? val = num.tryParse(value);

    return val != null && val <= max;
  }

  @override
  String get name => ValidationNames.mustBeMax;

  @override
  List<Object> get parameters => [max];
}
