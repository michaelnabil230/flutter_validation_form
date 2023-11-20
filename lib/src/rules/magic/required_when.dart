import 'package:validation_form/src/rules/rule.dart';
import 'package:validation_form/src/rules/text/required.dart';

class RequiredWhen extends Rule {
  final bool boolean;

  RequiredWhen({
    required this.boolean,
  });

  @override
  bool isValid(String value) {
    if (boolean) {
      return Required().isValid(value);
    }

    return true;
  }

  @override
  String get name => ValidationNames.requiredWhen;

  @override
  List get parameters => [boolean];
}
