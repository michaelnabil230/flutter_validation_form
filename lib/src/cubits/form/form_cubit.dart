import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:validation_form/validation_form.dart';

part 'form_state.dart';

abstract class FormCubit extends Cubit<FormState> {
  FormCubit({
    FormStatus status = FormStatus.enable,
    bool isEdit = false,
  }) : super(FormState(
          status: status,
          isEdit: isEdit,
        )) {
    _fields = initializeFields();

    _addStreamToFields();
    _addStreamToFieldsDepends();
  }

  List<FieldCubit> _fields = [];

  List<FieldCubit> get fields => _fields;

  List<FieldCubit> get fieldsDepends => [];

  List<FieldCubit> initializeFields();

  FutureOr<void> onSubmit();

  void setShowErrorOnAllFields() {
    for (final field in fields) {
      field.errorsCheck();
    }
  }

  void reset() {
    for (final field in fields) {
      field.reset();
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
      field.stream.listen((_) => refreshForm());
    }
    refreshForm();
  }

  void _addStreamToFieldsDepends() {
    for (final field in fieldsDepends) {
      field.stream.listen((_) {
        for (final field1 in fieldsDepends) {
          field1.errorsCheck();
        }
      });
    }
  }

  void refreshForm() {
    bool passes = _isPasses();

    Map<String, List<String>> errors = {};

    for (final field in fields) {
      errors.addAll({field.state.attribute: field.state.errors});
    }

    FormStatus status = passes ? FormStatus.enable : FormStatus.disable;

    emit(state.copyWith(status: status, errors: errors));
  }

  void loadingFrom() {
    emit(state.copyWith(status: FormStatus.loading));
  }

  bool _isPasses() {
    if (state.isEdit) {
      bool noInvalid = !fields.any((field) => field.state.isInvalid);
      bool anyValid = fields.any((field) => field.state.isValid);
      bool anyInitial = fields.any((field) => field.state.isInitial);

      bool noEveryInitial = !fields.every((field) => field.state.isInitial);

      return noInvalid && (anyValid && anyInitial || noEveryInitial);
    }

    return fields.every((field) => field.state.isValid);
  }
}
