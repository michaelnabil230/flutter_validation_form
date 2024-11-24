import 'package:example/cubits/profile/profile_cubit.dart';
import 'package:example/cubits/profile/profile_form.dart';
import 'package:flutter/material.dart' hide FormState;
import 'package:validation_form/validation_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileForm()),
        BlocProvider(create: (context) => ProfileCubit(form: context.read())),
      ],
      child: _ProfileView(),
    );
  }
}

class _ProfileView extends StatefulWidget {
  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  late ProfileForm _profileFormCubit;

  @override
  void initState() {
    _profileFormCubit = context.read<ProfileForm>();
    _profileFormCubit
        .initialize(UserDate(name: 'Michael', email: 'michael@example.com'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValidationTextField(
                cubit: _profileFormCubit.name,
                field: (context, controller, state) {
                  return TextField(
                    controller: controller,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      errorText: state.error,
                    ),
                  );
                },
              ),
              ValidationTextField(
                cubit: _profileFormCubit.email,
                field: (context, controller, state) {
                  return TextField(
                    controller: controller,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: state.error,
                    ),
                  );
                },
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ValidationButtonForm<ProfileForm, FormState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.status.isEnable
                              ? () => context.read<ProfileCubit>().onSubmit()
                              : null,
                          child: Text(switch (state.status) {
                            FormStatus.loading => 'loading',
                            FormStatus.disable => 'Disable',
                            FormStatus.enable => 'Enable',
                          }),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Reset'),
                      onPressed: () => _profileFormCubit.reset(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
