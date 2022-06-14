import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/core/errors/failures.dart';
import 'package:gword/app/core/helpers/notification_manager.dart';
import 'package:gword/app/modules/home/data/datasources/word_datasource.dart';
import 'package:gword/app/modules/home/data/models/word_model.dart';
import 'package:gword/app/modules/home/data/repositories/word_repository_implementation.dart';
import 'package:gword/app/modules/home/domain/usecases/get_current_word_usecase.dart';
import 'package:gword/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationManager extends Mock implements INotificationManager {}

class MockWordDatasource extends Mock implements IWordDatasource {}

void main() {
  late IWordDatasource localFilesImplementation;
  late HomeController homeController;
  late GetCurrentWordUsecase getCurrentWordUsecase;
  late WordRepositoryImplementation wordRepositoryImplementation;
  late INotificationManager notificationManager;

  setUp(() {
    notificationManager = MockNotificationManager();
    localFilesImplementation = MockWordDatasource();
    wordRepositoryImplementation = WordRepositoryImplementation(localFilesImplementation);
    getCurrentWordUsecase = GetCurrentWordUsecase(wordRepositoryImplementation);
    homeController = HomeController(
      getCurrentWordUsecase: getCurrentWordUsecase,
      notificationManager: notificationManager,
    );
  });

  const tWordModel = WordModel('teste');

  test('should get a valid word and persist when calls the home controller method', () async {
    when(() => localFilesImplementation.getCurrentWord()).thenAnswer((_) async => tWordModel);

    await homeController.getCurrentWord((_) => null);

    expect(
      homeController.currentWord,
      tWordModel,
    );
    verify(() => localFilesImplementation.getCurrentWord()).called(1);
  });

  test('should get a error when calls the home controller method', () async {
    when(() => localFilesImplementation.getCurrentWord()).thenAnswer((_) async => const WordModel('test'));

    Failure? error;

    dynamic onErrorCallback(e) => error = e;

    await homeController.getCurrentWord(onErrorCallback);

    expect(homeController.currentWord, null);
    expect(error, isA<InvalidWordFailure>());
    verify(() => localFilesImplementation.getCurrentWord()).called(1);
  });
}
