import 'package:flutter/material.dart';
import 'package:gword/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:gword/app/modules/home/presenter/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        controller: HomeController(),
      ),
    );
  }
}
