import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:validation_form/validation_form.dart';
import 'package:validation_form/src/rules/rule.dart';
import 'package:validation_form/src/types/index.dart';

part 'field_state.dart';

class FieldCubit extends Cubit<FieldState> {
  final String attribute;

  final String initialValue;

  final ValueGetter<List<Rule>> rules;

  final Map<String, ValidationMessage> validationMessages;

  FieldCubit({
    required this.attribute,
    this.initialValue = '',
    required this.rules,
    this.validationMessages = const {},
  }) : super(FieldState(
          attribute: attribute,
          initialValue: initialValue,
          value: initialValue,
        ));

  void setValue(String value) {
    if (state.isReset) {
      return emit(state.copyWith(isReset: false));
    }

    return emit(state.copyWith(
      value: value,
      errors: runValidation(value),
    ));
  }

  void errorsCheck() {
    addErrors(runValidation(state.value));
  }

  void reset() {
    emit(state.copyWith(
      value: initialValue,
      status: FieldStatus.initial,
      isReset: true,
      errors: [],
    ));
  }

  void addErrors(List<String> errors) {
    emit(state.copyWith(errors: errors));
  }

  List<String> runValidation(String value) {
    List<String> errors = [];

    for (final rule in rules()) {
      rule.initialization(attribute);

      if (!rule.isValid(value)) {
        final validationMessage = validationMessages[rule.name];

        if (validationMessage != null) {
          rule.customValidationMessage = validationMessage;
        }

        errors.add(rule.error);
      }
    }

    return errors;
  }

  @override
  String toString() {
    return 'FieldCubit(attribute: $attribute, initialValue: $initialValue, rules: $rules, validationMessages: $validationMessages)';
  }
}
