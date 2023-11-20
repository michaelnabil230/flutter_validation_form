import 'package:validation_form/src/rules/rule.dart';

class IsDateBefore extends Rule {
  final DateTime date;

  IsDateBefore(this.date);

  @override
  bool isValid(String value) {
    DateTime? input = DateTime.tryParse(value);

    return input != null && input.isBefore(date);
  }

  @override
  String get name => ValidationNames.mustBeBeforeDate;

  @override
  List get parameters => [date];
}
