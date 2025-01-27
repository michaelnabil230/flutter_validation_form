import 'package:validation_form/src/rules/lists/contains_any.dart';
import 'package:validation_form/src/rules/rule.dart';

class NotContainsAny extends Rule {
  final List<String> list;

  NotContainsAny(this.list);

  @override
  bool isValid(String value) => !containsAny(value, list);

  @override
  String get name => ValidationNames.mustNotContainsAny;

  @override
  List<Object> get parameters => [list];
}
