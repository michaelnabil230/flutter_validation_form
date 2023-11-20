import 'package:validation_form/src/rules/lists/is_not_in.dart';
import 'package:validation_form/src/rules/rule.dart';

class NotRepeat extends Rule {
  late List<String> list;

  NotRepeat();

  void setList(List<String> list) => this.list = list;

  @override
  bool isValid(String value) => IsNotIn(list).isValid(value);

  @override
  String get name => ValidationNames.notRepeat;
}
