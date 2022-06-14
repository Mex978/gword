import 'package:flutter/material.dart';

enum LanguageType { english, portugueseLocal }

const String portuguese = "pt";
const String english = "en";
const String assetPathLocalisations = "assets/translations";

const Locale portugueseLocal = Locale("pt");
const Locale englishLocal = Locale("en");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.portugueseLocal:
        return portuguese;
    }
  }
}
