part of 'form_cubit.dart';

class FormState extends Equatable {
  final FormStatus status;

  final bool isEdit;

  final Map<String, List<String>> errors;

  const FormState({
    this.status = FormStatus.enable,
    this.isEdit = false,
    this.errors = const {},
  });

  FormState copyWith({
    FormStatus? status,
    bool? isEdit,
    Map<String, List<String>>? errors,
  }) {
    return FormState(
      status: status ?? this.status,
      isEdit: isEdit ?? this.isEdit,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object> get props => [status, isEdit, errors];

  @override
  String toString() =>
      'FormState(status: $status, isEdit: $isEdit, errors: $errors)';
}
