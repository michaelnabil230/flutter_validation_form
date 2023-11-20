import 'package:validation_form/src/rules/rule.dart';

class RangeLength extends Rule {
  final int min;

  final int max;

  RangeLength({
    required this.min,
    required this.max,
  });

  @override
  bool isValid(String value) {
    int length = value.trim().length;

    return length <= max && length >= min;
  }

  @override
  String get name => ValidationNames.mustBeRange;

  @override
  List<Object> get parameters => [min, max];
}
