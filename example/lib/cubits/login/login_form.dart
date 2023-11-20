import 'package:validation_form/validation_form.dart';

class LoginForm extends FormCubit {
  LoginForm() : super(status: FormStatus.enable);

  late FieldCubit email;

  late FieldCubit password;

  late FieldCubit passwordConfirm;

  @override
  List<FieldCubit> initializeFields() {
    email = FieldCubit(
      attribute: 'email',
      validationMessages: {
        ValidationNames.required: (attribute, [_ = const []]) =>
            'The email is required field'
      },
      initialValue: 'michael@example.com',
      rules: () => [
        Validations.required,
        Validations.isEmail,
      ],
    );

    password = FieldCubit(
      attribute: 'password',
      rules: () => [
        Required(),
        Password(min: 3),
        ConfirmedPassword(passwordConfirm.state.value),
      ],
    );

    passwordConfirm = FieldCubit(
      attribute: 'password_confirm',
      rules: () => [
        Required(),
        Password(min: 3),
      ],
    );

    return [email, password, passwordConfirm];
  }

  @override
  List<FieldCubit> get fieldsDepends => [password, passwordConfirm];
}
