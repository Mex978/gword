import 'package:flutter/material.dart';
import 'package:gword/app/core/pages/splash_page.dart';
import 'package:gword/app/modules/home/presenter/pages/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    initial: (context) => const SplashPage(),
    home: (context) => const HomePage(),
  };

  static const String initial = '/';
  static const String home = '/home';
}
