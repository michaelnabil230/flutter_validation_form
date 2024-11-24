import 'package:flutter/widgets.dart';
import 'package:validation_form/validation_form.dart';

class LoginForm extends FormCubit {
  late FieldCubit name;

  late FieldCubit email;

  late FieldCubit password;

  late FieldCubit passwordConfirm;

  late ValueNotifier<bool> _isAdminNotifier;

  ValueNotifier<bool> get isAdminNotifier => _isAdminNotifier;

  bool get isAdmin => _isAdminNotifier.value;

  @override
  void initialize([dynamic data]) {
    _isAdminNotifier = ValueNotifier(true);
    super.initialize(data);
  }

  @override
  List<FieldCubit> initializeFields(dynamic data) {
    data as UserDate;

    name = FieldCubit(
      attribute: 'name',
      rules: () => [
        Validations.required,
      ]..when(isAdmin, [Validations.minLength(10)]),
    );

    email = FieldCubit(
      attribute: 'email',
      validationMessages: {
        ValidationNames.required: (attribute, [_ = const []]) =>
            'The email is required field'
      },
      initialValue: data.email,
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
    )..stream.listen((_) => password.errorsCheck());

    return [name, email, password, passwordConfirm];
  }

  void onChangedIsAdmin() {
    _isAdminNotifier.value = !isAdmin;
    name
      ..reset()
      ..errorsCheck();
  }

  @override
  Future<void> close() {
    if (initialized) {
      _isAdminNotifier.dispose();
    }
    return super.close();
  }
}

class UserDate {
  late String? name;
  late String email;

  UserDate({
    this.name,
    required this.email,
  });
}
