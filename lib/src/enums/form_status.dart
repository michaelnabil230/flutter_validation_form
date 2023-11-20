enum FormStatus {
  enable,
  disable,
  loading;

  bool get isEnable => this == FormStatus.enable;

  bool get isDisable => this == FormStatus.disable;

  bool get isLoading => this == FormStatus.loading;

  bool get canSubmit => isDisable || isLoading;
}
