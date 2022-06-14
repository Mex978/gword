import 'package:get_it/get_it.dart';
import 'package:gword/app/core/helpers/bot_toast_notification_manager.dart';
import 'package:gword/app/core/injector/injector.dart';

class AppInjector extends IInjector {
  AppInjector._internal();

  static AppInjector get instance => AppInjector._internal();

  final _locator = GetIt.I;

  @override
  Future<void> dispose() async {
    _locator.reset();
  }

  @override
  T get<T extends Object>() {
    return _locator.get<T>();
  }

  @override
  Future<void> init() async {
    _locator.registerLazySingleton(() => BotToastNotificationManager());
  }
}
