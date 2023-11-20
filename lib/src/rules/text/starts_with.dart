import 'package:validation_form/src/rules/rule.dart';

class StartsWith extends Rule {
  final Pattern pattern;

  StartsWith(this.pattern);

  @override
  bool isValid(String value) => value.trim().startsWith(pattern);

  @override
  String get name => ValidationNames.startsWith;

  @override
  List<Object> get parameters => [pattern];
}
