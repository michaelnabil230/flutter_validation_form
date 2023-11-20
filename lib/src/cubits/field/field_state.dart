part of 'field_cubit.dart';

class FieldState extends Equatable {
  final String initialValue;

  final String value;

  final String attribute;

  final bool isReset;

  final List<String> errors;

  final FieldStatus status;

  FieldState({
    required this.initialValue,
    required this.value,
    required this.attribute,
    this.isReset = false,
    this.errors = const [],
    FieldStatus? status,
  }) : status = status ??
            (value.isNotEmpty ? FieldStatus.valid : FieldStatus.initial);

  String? get error => errors.isNotEmpty ? errors.first : null;

  bool get isInitial => status.isInitial;

  bool get isValid => error == null && status.isValid;

  bool get isInvalid => status.isInvalid;

  FieldState copyWith({
    String? value,
    List<String>? errors,
    FieldStatus? status,
    bool? isReset,
  }) {
    List<String> finalErrors = errors ?? this.errors;
    FieldStatus finalStatus = status ??
        (finalErrors.isEmpty ? FieldStatus.valid : FieldStatus.invalid);

    return FieldState(
      attribute: attribute,
      initialValue: initialValue,
      value: value ?? this.value,
      isReset: isReset ?? this.isReset,
      errors: finalErrors,
      status: finalStatus,
    );
  }

  @override
  String toString() {
    return 'FieldState(attribute: $attribute, initialValue: $initialValue, value: $value, errors: $errors, status: $status)';
  }

  @override
  List<Object?> get props => [attribute, initialValue, isReset, value, errors];
}
