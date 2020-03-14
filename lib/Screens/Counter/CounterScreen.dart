import 'package:demo_app/Hooks/Shared/useCounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counterHook = useCounter();
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: counterHook['decrement'],
                  ),
                ),
                Center(
                  child: Text(
                    "${counterHook['counter'].value}",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: counterHook['increment'],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
