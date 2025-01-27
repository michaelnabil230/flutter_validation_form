import 'package:validation_form/src/rules/lists/is_in.dart';
import 'package:validation_form/src/rules/rule.dart';

class IsNotIn extends Rule {
  final List<String> list;

  IsNotIn(this.list);

  @override
  bool isValid(String value) => !isIn(value, list);

  @override
  String get name => ValidationNames.mustNotBeInList;

  @override
  List<Object> get parameters => [list];
}
