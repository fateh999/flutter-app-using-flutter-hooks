import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'Screens/Login/LoginScreen.dart';

void main() => runApp(DemoApp());

class DemoApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
