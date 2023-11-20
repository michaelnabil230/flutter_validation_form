import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/cubits/login/login_form.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginForm form;

  LoginCubit({
    required this.form,
  }) : super(LoginInitial());

  void onSubmit() async {
    log('===Start===');
    form.loadingFrom();
    await Future.delayed(const Duration(seconds: 2));
    log(form.email.state.value);
    log(form.password.state.value);
    log('===End===');

    if (Random().nextBool()) {
      form.email.addErrors(['Massage error form backend']);
      form.refreshForm();
      log('From has errors form backend');
    } else {
      form.reset();
      log('From passed successfully');
    }
  }
}
