import 'package:validation_form/validation_form.dart';

class ProfileForm extends FormCubit {
  late FieldCubit name;

  late FieldCubit email;

  @override
  bool get isEdit => true;

  @override
  List<FieldCubit> initializeFields(data) {
    data as UserDate;

    name = FieldCubit(
      attribute: 'name',
      initialValue: data.name,
      rules: () => [Validations.required],
    );

    email = FieldCubit(
      attribute: 'email',
      initialValue: data.email,
      validationMessages: {
        ValidationNames.required: (attribute, [_ = const []]) =>
            'The email is required field'
      },
      rules: () => [
        Validations.required,
        Validations.isEmail,
      ],
    );

    return [name, email];
  }
}

class UserDate {
  late String name;
  late String email;

  UserDate({
    required this.name,
    required this.email,
  });
}
