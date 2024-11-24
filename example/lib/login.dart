import 'package:example/cubits/login/login_cubit.dart';
import 'package:example/cubits/login/login_form.dart';
import 'package:flutter/material.dart' hide FormState;
import 'package:validation_form/validation_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginForm()),
        BlocProvider(create: (context) => LoginCubit(form: context.read())),
      ],
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  late LoginForm _loginFormCubit;

  @override
  void initState() {
    _loginFormCubit = context.read<LoginForm>();
    _loginFormCubit.initialize(UserDate(email: 'michael@example.com'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValidationTextField(
                cubit: _loginFormCubit.name,
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
                cubit: _loginFormCubit.email,
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
              ValidationTextField(
                cubit: _loginFormCubit.password,
                field: (context, controller, state) {
                  return TextField(
                    controller: controller,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: state.error,
                    ),
                  );
                },
              ),
              ValidationTextField(
                cubit: _loginFormCubit.passwordConfirm,
                field: (context, controller, state) {
                  return TextField(
                    controller: controller,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Password confirm',
                      errorText: state.error,
                    ),
                  );
                },
              ),
              Row(
                children: [
                  const Text('Is admin'),
                  const SizedBox(width: 10),
                  ValueListenableBuilder<bool>(
                    valueListenable: _loginFormCubit.isAdminNotifier,
                    builder: (BuildContext context, bool value, _) {
                      return Checkbox(
                        value: value,
                        onChanged: (_) => _loginFormCubit.onChangedIsAdmin(),
                      );
                    },
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ValidationButtonForm<LoginForm, FormState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.status.isEnable
                              ? () => context.read<LoginCubit>().onSubmit()
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
                      onPressed: () => _loginFormCubit.reset(),
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
