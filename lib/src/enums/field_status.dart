enum FieldStatus {
  initial,
  valid,
  invalid;

  bool get isInitial => this == FieldStatus.initial;

  bool get isValid => this == FieldStatus.valid;

  bool get isInvalid => this == FieldStatus.invalid;
}
