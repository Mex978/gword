import 'package:flutter/material.dart';
import 'package:gword/app/core/helpers/internacionalization_manager.dart';

import 'app/my_app.dart';

void main() async {
  await initialize();
  runApp(const MyApp());
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InternacionalizationManager.initialize();
}
