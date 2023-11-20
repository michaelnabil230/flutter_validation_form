import 'package:flutter/widgets.dart';
import 'package:validation_form/validation_form.dart';

class IsAdminNotifier extends ValueNotifier<bool> {
  IsAdminNotifier() : super(false);
}

class LoginForm extends FormCubit {
  LoginForm() : super(status: FormStatus.enable);

  late FieldCubit name;

  late FieldCubit email;

  late FieldCubit password;

  late FieldCubit passwordConfirm;

  bool _isAdmin = true;

  void onChangedIsAdmin(IsAdminNotifier isAdminNotifier) {
    _isAdmin = !_isAdmin;
    isAdminNotifier.value = !isAdminNotifier.value;
    name.reset();
  }

  @override
  List<FieldCubit> initializeFields() {
    name = FieldCubit(
      attribute: 'name',
      rules: () =>
          [Validations.required]..when(_isAdmin, [Validations.minLength(10)]),
    );

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
        Validations.required,
        Validations.password(min: 4),
        Validations.confirmedPassword(passwordConfirm.state.value),
      ],
    );

    passwordConfirm = FieldCubit(
      attribute: 'password_confirm',
      rules: () => [
        Validations.required,
        Validations.password(min: 4),
      ],
    );

    return [name, email, password, passwordConfirm];
  }

  @override
  List<FieldCubit> get fieldsDepends => [password, passwordConfirm];
}
