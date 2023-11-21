import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:validation_form/validation_form.dart';
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
  }) : super(FieldState.initialize(attribute, initialValue));

  void setValue(String value) {
    return emit(state.copyWith(
      value: value,
      errors: runValidation(value),
      showError: true,
    ));
  }

  void setInitialValue(String value) {
    return emit(state.copyWith(
      initialValue: value,
      showError: false,
    ));
  }

  void errorsCheck() {
    addErrors(runValidation(state.value));
  }

  void reset([bool withShowError = false]) {
    emit(state.copyWith(
      value: initialValue,
      status: FieldStatus.initial,
      errors: [],
      showError: withShowError,
    ));
  }

  void addErrors(List<String> errors) {
    emit(state.copyWith(errors: errors));
  }

  List<String> runValidation(String value) {
    List<String> errors = [];

    for (final rule in rules()) {
      rule.attribute = attribute;

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
