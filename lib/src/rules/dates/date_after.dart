import 'package:validation_form/src/rules/rule.dart';

class IsDateAfter extends Rule {
  final DateTime date;

  IsDateAfter(this.date);

  @override
  bool isValid(String value) {
    DateTime? input = DateTime.tryParse(value);

    return input != null && input.isAfter(date);
  }

  @override
  String get name => ValidationNames.mustBeAfterDate;

  @override
  List get parameters => [date];
}
