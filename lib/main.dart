import 'package:demo_app/Screens/Counter/CounterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'Screens/Login/LoginScreen.dart';

void main() => runApp(DemoApp());

class DemoApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final loggedIn = useState(false);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loggedIn.value ? CounterScreen() : LoginScreen(),
    );
  }
}
