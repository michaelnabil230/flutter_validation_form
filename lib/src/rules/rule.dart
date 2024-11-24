import 'package:validation_form/src/classes/validation_messages.dart';
import 'package:validation_form/src/types/index.dart';

export 'package:validation_form/src/classes/validation_names.dart';

abstract class Rule {
  late String attribute;

  ValidationMessage? customValidationMessage;

  bool isValid(String value);

  String get name;

  List<Object> get parameters => [];

  String get error {
    return customValidationMessage == null
        ? ValidationMessages.defaultMessages[name]!.call(attribute, parameters)
        : customValidationMessage!.call(attribute, parameters);
  }
}
