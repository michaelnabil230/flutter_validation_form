part of 'field_cubit.dart';

class FieldState extends Equatable {
  final String initialValue;

  final String value;

  final String attribute;

  final List<String> errors;

  final bool showError;

  const FieldState({
    required this.initialValue,
    required this.value,
    required this.attribute,
    this.errors = const [],
    this.showError = false,
  });

  FieldStatus get status {
    if (initialValue == value) {
      return FieldStatus.initial;
    }

    if (errors.isNotEmpty) {
      return FieldStatus.invalid;
    }

    return FieldStatus.valid;
  }

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
  }) {
    return FieldState(
      attribute: attribute,
      initialValue: initialValue ?? this.initialValue,
      value: value ?? this.value,
      errors: errors ?? this.errors,
      showError: showError ?? this.showError,
    );
  }

  @override
  String toString() {
    return 'FieldState(attribute: $attribute, initialValue: $initialValue, value: $value, showError: $showError, errors: $errors, status: $status)';
  }

  @override
  List<Object?> get props => [attribute, initialValue, value, errors];
}
