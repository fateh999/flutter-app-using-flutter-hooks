import 'package:demo_app/Hooks/Shared/useForm.dart';
import 'package:demo_app/Hooks/Shared/useHTTP.dart';
import 'package:demo_app/Screens/Counter/CounterScreen.dart';
import 'package:demo_app/Widgets/Shared/AppButton/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginForm extends HookWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final httpHook = useHTTP();
    final formHook =
        useForm({"email": 'fateh@gmail.com', "password": '1234567'});

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
              initialValue: formHook.form.value['email'],
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
              onChanged: (text) => formHook.updateForm('email', text),
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
              initialValue: formHook.form.value['password'],
              onChanged: (text) => formHook.updateForm('password', text),
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
              child: AppButton(
                onPressed: () async {
                  print(formHook.form.value);
                  print(httpHook);
                  if (formKey.currentState.validate()) {
                    httpHook.initiateReq('POST', 'user_login', {
                      "user_email": formHook.form.value['email'],
                      "password": formHook.form.value['password']
                    }, (response) {
                      print(response);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CounterScreen()),
                      );
                    }, (e) => print(e.response));
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 22),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                loading: httpHook.loading.value,
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
