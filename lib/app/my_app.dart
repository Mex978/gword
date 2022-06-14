import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gword/app/core/config/routes/app_routes.dart';
import 'package:gword/app/core/config/themes/app_theme.dart';
import 'package:gword/app/core/helpers/internacionalization_manager.dart';
import 'package:gword/app/core/injector/app_injector.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final botToastBuilder = BotToastInit();

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    AppInjector.instance.init();
    WidgetsBinding.instance.addObserver(this);

    InternacionalizationManager.listen(() {
      rebuildAllChildren(context);
    });

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    InternacionalizationManager.lifeCycle(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    AppInjector.instance.dispose();
    WidgetsBinding.instance.removeObserver(this);
    InternacionalizationManager.unlisten(() {
      setState(() {});
    });
    super.dispose();
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      initialRoute: AppRoutes.initial,
      routes: AppRoutes.routes,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
