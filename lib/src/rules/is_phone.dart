import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:validation_form/src/rules/rule.dart';

class IsPhone extends Rule {
  final IsoCode? callerCountry;

  final IsoCode? destinationCountry;

  IsPhone({
    this.callerCountry,
    this.destinationCountry,
  });

  @override
  bool isValid(String value) {
    try {
      PhoneNumber phone = PhoneNumber.parse(
        value.trim(),
        callerCountry: callerCountry,
        destinationCountry: destinationCountry,
      );

      return phone.isValid();
    } catch (e) {
      return false;
    }
  }

  @override
  String get name => ValidationNames.isPhone;
}
