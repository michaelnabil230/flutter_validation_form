import 'package:validation_form/src/rules/rule.dart';

class Same extends Rule {
  final String same;

  Same(this.same);

  @override
  bool isValid(String value) => value == same;

  @override
  String get name => ValidationNames.same;

  @override
  List<Object> get parameters => [same];
}
