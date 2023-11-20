import 'package:validation_form/src/rules/rule.dart';

class EndsWith extends Rule {
  final String end;

  EndsWith(this.end);

  @override
  bool isValid(String value) => value.trim().endsWith(end);

  @override
  String get name => ValidationNames.mustEndWith;

  @override
  List<Object> get parameters => [end];
}
