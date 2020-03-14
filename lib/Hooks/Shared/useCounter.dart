import 'package:flutter_hooks/flutter_hooks.dart';

dynamic useCounter() {
  final counter = useState(0);

  increment() => counter.value++;

  decrement() => counter.value--;

  Map counterObj = {
    "counter": counter,
    "increment": increment,
    "decrement": decrement
  };

  return counterObj;
}
