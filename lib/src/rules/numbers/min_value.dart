import 'package:validation_form/src/rules/rule.dart';

class MinValue extends Rule {
  final int min;

  MinValue(this.min);

  @override
  bool isValid(String value) {
    num? val = num.tryParse(value);

    return val != null && val >= min;
  }

  @override
  String get name => ValidationNames.mustBeMin;

  @override
  List<Object> get parameters => [min];
}
