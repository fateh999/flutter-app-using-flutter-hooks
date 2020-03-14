import 'package:demo_app/Hooks/Shared/useForm.dart';
import 'package:demo_app/Screens/Counter/CounterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginForm extends HookWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final formHook =
        useForm({"email": 'test@test.com', "password": '12345678'});
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              initialValue: formHook['form'].value['email'],
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
              onChanged: (text) => formHook['updateForm']('email', text),
            ),
            Container(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              initialValue: formHook['form'].value['password'],
              onChanged: (text) => formHook['updateForm']('password', text),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            Container(
              height: 20,
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  print(formHook['form'].value);
                  formKey.currentState.validate();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CounterScreen()),
                  );
                },
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
              width: 300,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
