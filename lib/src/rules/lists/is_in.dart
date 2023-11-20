import 'package:validation_form/src/rules/rule.dart';

class IsIn extends Rule {
  final List<String> list;

  IsIn(this.list);

  @override
  bool isValid(String value) => isIn(value, list);

  @override
  String get name => ValidationNames.mustBeInList;

  @override
  List get parameters => [list];
}

bool isIn(String v, List<String> list) => list.any((e) => e.compareTo(v) == 0);
