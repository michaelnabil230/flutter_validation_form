import 'package:example/login.dart';
import 'package:example/profile.dart';
import 'package:flutter/material.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  runApp(ValidationMessages(
    messages: {
      ValidationNames.required: (attribute, [_ = const []]) {
        return 'The $attribute field is must be required';
      }
    },
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
            ElevatedButton(
              child: const Text('Profile'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
