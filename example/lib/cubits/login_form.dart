import 'dart:math' hide log;
import 'dart:developer';

import 'package:validation_form/validation_form.dart';

class LoginForm extends FormCubit {
  LoginForm() : super(status: FormStatus.enable, isEdit: false);

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
        Required(),
        NotRepeat(),
        IsEmail(),
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

  @override
  void onSubmit() async {
    log('===Start===');
    loadingFrom();
    await Future.delayed(const Duration(seconds: 2));
    log(email.state.value);
    log(password.state.value);
    log('===End===');

    if (Random().nextBool()) {
      email.addErrors(['Massage error form backend']);
      refreshForm();
      log('From has errors form backend');
    } else {
      reset();
      log('From passed successfully');
    }
  }
}
