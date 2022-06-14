import 'package:gword/app/core/helpers/internacionalization_manager.dart';

extension StringInternacionalization on String {
  String get i18n => InternacionalizationManager.getString(this);
}

class StringsManager {
  static String title = "title";
  static String button = "button";
}
