part of 'field_cubit.dart';

class FieldState extends Equatable {
  final String initialValue;

  final String value;

  final String attribute;

  final List<String> errors;

  final FieldStatus status;

  final bool showError;

  FieldState({
    required this.initialValue,
    required this.value,
    required this.attribute,
    this.errors = const [],
    this.showError = false,
    FieldStatus? status,
  }) : status = status ??
            (value.isNotEmpty ? FieldStatus.valid : FieldStatus.initial);

  factory FieldState.initialize(String attribute, String initialValue) =>
      FieldState(
        attribute: attribute,
        initialValue: initialValue,
        value: initialValue,
      );

  String? get error {
    if (showError) {
      return errors.isNotEmpty ? errors.first : null;
    }

    return null;
  }

  bool get isInitial => status.isInitial;

  bool get isValid => error == null && status.isValid;

  bool get isInvalid => status.isInvalid;

  FieldState copyWith({
    String? value,
    String? initialValue,
    List<String>? errors,
    bool? showError,
    FieldStatus? status,
  }) {
    List<String> finalErrors = errors ?? this.errors;
    FieldStatus finalStatus = status ??
        (finalErrors.isEmpty ? FieldStatus.valid : FieldStatus.invalid);

    return FieldState(
      attribute: attribute,
      initialValue: initialValue ?? this.initialValue,
      value: value ?? this.value,
      errors: finalErrors,
      showError: showError ?? this.showError,
      status: finalStatus,
    );
  }

  @override
  String toString() {
    return 'FieldState(attribute: $attribute, initialValue: $initialValue, value: $value, showError: $showError, errors: $errors, status: $status)';
  }

  @override
  List<Object?> get props => [attribute, initialValue, value, errors];
}
