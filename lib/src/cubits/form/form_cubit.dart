import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:validation_form/validation_form.dart';

part 'form_state.dart';

abstract class FormCubit extends Cubit<FormState> with _FormAllies {
  FormCubit() : super(const FormState());

  List<FieldCubit> _fields = [];

  List<FieldCubit> get fields => _fields;

  BuildContext? context;

  bool _initialized = false;

  bool get initialized => _initialized;

  bool get isEdit => false;

  void initialize([BuildContext? context, dynamic data]) {
    this.context = context;
    _fields = initializeFields(data);
    _addStreamToFields();
    setShowErrorOnAllFields();
    refresh();
    _initialized = true;
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
      field.stream.listen((_) => refresh());
    }
  }

  void refresh() {
    Map<String, List<String>> errors = {
      for (final field in fields) field.state.attribute: field.state.errors
    };

    bool passes = _isPasses(errors);

    FormStatus status = passes ? FormStatus.enable : FormStatus.disable;

    emit(state.copyWith(status: status, errors: errors));
  }

  bool _isPasses(Map<String, List<String>> errors) {
    if (!isEdit) {
      return errors.values.expand((error) => error).toList().isEmpty;
    }

    bool noInvalid = !fields.any((field) => field.state.isInvalid);
    bool anyValid = fields.any((field) => field.state.isValid);
    bool anyInitial = fields.any((field) => field.state.isInitial);

    bool noEveryInitial = !fields.every((field) => field.state.isInitial);

    return noInvalid && (anyValid && anyInitial || noEveryInitial);
  }
}

mixin _FormAllies on Cubit<FormState> {
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
