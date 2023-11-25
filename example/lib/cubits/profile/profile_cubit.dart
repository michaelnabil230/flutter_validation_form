import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/cubits/profile/profile_form.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileForm form;

  ProfileCubit({
    required this.form,
  }) : super(ProfileInitial());

  void onSubmit() async {
    log('===Start===');
    form.loading();
    await Future.delayed(const Duration(seconds: 2));
    log(form.name.state.value);
    log(form.email.state.value);
    log('===End===');
  }
}
