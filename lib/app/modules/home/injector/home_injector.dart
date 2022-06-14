import 'package:get_it/get_it.dart';
import 'package:gword/app/core/helpers/bot_toast_notification_manager.dart';
import 'package:gword/app/core/injector/injector.dart';
import 'package:gword/app/modules/home/data/datasources/local_files/local_files_implementation.dart';
import 'package:gword/app/modules/home/data/repositories/word_repository_implementation.dart';
import 'package:gword/app/modules/home/domain/usecases/get_current_word_usecase.dart';
import 'package:gword/app/modules/home/presenter/controllers/home_controller.dart';

class HomeInjector extends IInjector {
  HomeInjector._internal();

  static HomeInjector get instance => HomeInjector._internal();

  final _locator = GetIt.I;

  @override
  T get<T extends Object>() {
    return _locator.get<T>();
  }

  @override
  Future<void> init() async {
    _locator.registerLazySingleton(() => LocalFilesImplementation());
    _locator.registerLazySingleton(() => WordRepositoryImplementation(_locator.get<LocalFilesImplementation>()));
    _locator.registerLazySingleton(() => GetCurrentWordUsecase(_locator.get<WordRepositoryImplementation>()));
    _locator.registerLazySingleton(
      () => HomeController(
        getCurrentWordUsecase: GetCurrentWordUsecase(_locator.get<WordRepositoryImplementation>()),
        notificationManager: BotToastNotificationManager(),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    await _locator.reset();
  }
}
