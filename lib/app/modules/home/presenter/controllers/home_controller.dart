import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final counter = ValueNotifier<int>(0);
  final counter2 = ValueNotifier<int>(1);

  int get counterValue => counter.value;
  int get counterValue2 => counter2.value;

  void increment() {
    counter.value++;
  }

  void increment2() {
    counter2.value *= 2;
  }

  @override
  void dispose() {
    counter.dispose();
    counter2.dispose();
    super.dispose();
  }
}
