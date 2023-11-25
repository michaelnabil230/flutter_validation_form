part of 'form_cubit.dart';

class FormState extends Equatable {
  final FormStatus status;

  final Map<String, List<String>> errors;

  const FormState({
    this.status = FormStatus.disable,
    this.errors = const {},
  });

  FormState copyWith({FormStatus? status, Map<String, List<String>>? errors}) {
    return FormState(
      status: status ?? this.status,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object> get props => [status, errors];

  @override
  String toString() => 'FormState(status: $status, errors: $errors)';
}
