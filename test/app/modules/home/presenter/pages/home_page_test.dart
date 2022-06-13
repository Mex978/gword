import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:gword/app/modules/home/presenter/pages/home_page.dart';

void main() {
  late HomeController controller;

  setUp(() {
    controller = HomeController();
  });

  testWidgets('home page ...', (tester) async {
    final widget = HomePage(
      controller: controller,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: widget,
      ),
    );

    final homePageFinder = find.byWidget(widget);
    expect(homePageFinder, findsOneWidget);

    int currentValue = controller.counter.value;

    Finder firstValueFinder = find.byKey(const ValueKey('text'));
    Text text = firstValueFinder.evaluate().single.widget as Text;
    expect(text.data, currentValue.toString());

    final floatingActionButtonFinder = find.byType(FloatingActionButton);
    await tester.tap(floatingActionButtonFinder);
    await tester.pump();

    currentValue = controller.counter.value;
    text = firstValueFinder.evaluate().single.widget as Text;
    expect(text.data, currentValue.toString());
  });
}
