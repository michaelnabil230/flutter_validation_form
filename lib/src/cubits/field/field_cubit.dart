import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_form/validation_form.dart';

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

  void errorsCheck([bool? withShowError = false]) {
    emit(state.copyWith(
      errors: runValidation(state.value),
      showError: withShowError,
    ));
  }

  void reset([bool withShowError = false]) {
    emit(state.copyWith(
      value: initialValue,
      errors: [],
      showError: withShowError,
    ));
  }

  void addErrors(List<String> errors, [bool? withShowError = true]) {
    emit(state.copyWith(
      errors: errors,
      showError: withShowError,
    ));
  }

  List<String> runValidation(String value) {
    List<String> errors = [];

    for (final rule in rules()) {
      rule.attribute = attribute;

      if (!rule.isValid(value)) {
        ValidationMessage? message = validationMessages[rule.name];

        message ??= ValidationMessages.messages[rule.name];

        if (message != null) {
          rule.customValidationMessage = message;
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
