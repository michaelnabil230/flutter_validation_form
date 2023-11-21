import 'package:equatable/equatable.dart';

import 'package:validation_form/validation_form.dart';

part 'form_state.dart';

abstract class FormCubit extends Cubit<FormState> with _Allies {
  FormCubit({
    FormStatus status = FormStatus.disable,
  }) : super(FormState(status: status));

  List<FieldCubit> _fields = [];

  List<FieldCubit> get fields => _fields;

  void initialize([dynamic data]) {
    _fields = initializeFields(data);
    _addStreamToFields();
    setShowErrorOnAllFields();
    refresh();
  }

  List<FieldCubit> initializeFields(dynamic data);

  void setShowErrorOnAllFields() {
    for (final field in fields) {
      field.errorsCheck();
    }
  }

  void reset([bool withShowError = false]) {
    for (final field in fields) {
      field.reset(withShowError);
    }
  }

  @override
  Future<void> close() async {
    for (final field in fields) {
      field.close();
    }
    await super.close();
  }

  void _addStreamToFields() {
    for (final field in fields) {
      field.stream.listen((_) {
        setShowErrorOnAllFields();
        refresh();
      });
    }
  }

  void refresh() {
    Map<String, List<String>> errors = {
      for (final field in fields) field.state.attribute: field.state.errors
    };

    bool passes = errors.values.expand((error) => error).toList().isEmpty;

    FormStatus status = passes ? FormStatus.enable : FormStatus.disable;

    emit(state.copyWith(status: status, errors: errors));
  }
}

mixin _Allies on Cubit<FormState> {
  FormStatus get status => state.status;

  bool get isEnable => status.isEnable;

  bool get isDisable => status.isDisable;

  bool get isLoading => status.isLoading;

  bool get canSubmit => status.canSubmit;

  Map<String, List<String>> get errors => state.errors;

  void changeStatus(FormStatus status) => emit(state.copyWith(status: status));

  void loading() => changeStatus(FormStatus.loading);

  void disable() => changeStatus(FormStatus.disable);

  void enable() => changeStatus(FormStatus.enable);
}
