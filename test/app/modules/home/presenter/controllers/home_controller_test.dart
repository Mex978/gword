import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/modules/home/presenter/controllers/home_controller.dart';

void main() {
  late HomeController controller;

  setUp(() {
    controller = HomeController();
  });

  test(
    'home controller ...',
    () {
      while (controller.counterValue < 10) {
        controller.increment();
      }
      expect(controller.counter.value, 10);
    },
  );
}
