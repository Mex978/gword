import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gword/app/core/resources/assets_manager.dart';

class InternacionalizationManager {
  InternacionalizationManager._internal();

  static InternacionalizationManager get instance => InternacionalizationManager._internal();

  static String? oldLocale;
  static String? currentLocale;

  static final map = ValueNotifier<Map<String, dynamic>>({});

  static void lifeCycle(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) updateLocale();
  }

  static void listen(Function() callback) {
    map.addListener(() {
      if (oldLocale != currentLocale) callback();
    });
  }

  static void unlisten(Function() callback) {
    map.removeListener(callback);
  }

  static Future<void> initialize() async {
    updateLocale();
    getInternacionalizationMap();
  }

  static void updateLocale() {
    oldLocale = currentLocale;
    currentLocale = Platform.localeName;
    getInternacionalizationMap();
  }

  static Future<List<String>> listLocales() async {
    final locales = json
        .decode(await rootBundle.loadString('AssetManifest.json'))
        .keys
        .where((String key) => key.contains(translationPath))
        .toList() as List<String>;

    log(locales.toString(), name: 'locale');
    return locales;
  }

  static void getInternacionalizationMap() async {
    final locales = await listLocales();

    String? locale;

    if (currentLocale != null) locale = locales.firstWhere((locale) => locale.contains(currentLocale!));

    if (locale != null) {
      InternacionalizationManager.map.value = json.decode(await rootBundle.loadString(locale));
    } else {
      InternacionalizationManager.map.value = json.decode(await rootBundle.loadString(TranslationAssets.enUS));
    }
  }

  static String getString(String key) {
    return map.value[key] ?? '';
  }
}
