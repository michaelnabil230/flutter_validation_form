import 'package:validation_form/src/rules/rule.dart';
import 'package:validation_form/src/rules/text/required.dart';

class RequiredWhen extends Rule {
  final bool condition;

  final String conditionName;

  RequiredWhen({
    required this.condition,
    required this.conditionName,
  });

  @override
  bool isValid(String value) {
    if (condition) {
      return Required().isValid(value);
    }

    return true;
  }

  @override
  String get name => ValidationNames.requiredWhen;

  @override
  List<Object> get parameters => [conditionName];
}
