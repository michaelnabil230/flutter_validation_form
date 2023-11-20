import 'package:example/cubits/login_form.dart';
import 'package:flutter/material.dart' hide FormState;
import 'package:validation_form/validation_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider.value(
        value: LoginForm(),
        child: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginForm get _loginFormCubit => context.read<LoginForm>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ValidationButtonForm<LoginForm, FormState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.status.isEnable
                              ? () => _loginFormCubit.onSubmit()
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
