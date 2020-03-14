import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterHookType {
  ValueNotifier<int> counter;
  Function() increment;
  Function() decrement;
}

CounterHookType useCounter() {
  final counter = useState(0);

  increment() => counter.value++;

  decrement() => counter.value--;

  CounterHookType counterObj = {
    "counter": counter,
    "increment": increment,
    "decrement": decrement
  } as CounterHookType;

  return counterObj;
}
