import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/core/local_storage_client/local_storage_client.dart';
import 'package:gword/app/core/local_storage_client/shared_preferences_client_implementation.dart';
import 'package:gword/app/modules/home/external/datasources/local_storage_datasource/local_storage_datasource_implementation.dart';
import 'package:gword/app/modules/home/infra/datasources/word_datasource.dart';
import 'package:gword/app/modules/home/infra/models/word_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final initialData = {
    'words': ['word1', 'word2']
  };

  late IWordDatasource datasource;
  late ILocalStorageClient localStorageClient;
  late SharedPreferences sharedPreferences;

  setUp(() async {
    SharedPreferences.setMockInitialValues(initialData);
    sharedPreferences = await SharedPreferences.getInstance();
    localStorageClient = SharedPreferencesClientImplementation(sharedPreferences);
    datasource = LocalStorageDatasourceImplementation(localStorageClient);
  });

  test('should return a single word when calls datasource', () async {
    final word = await datasource.getCurrentWord();

    expect(word.word, isNotNull);
    expect(word.word, isNotEmpty);
    expect(word.isValidWord, true);
  });

  test('should save a try when calls datasource', () async {
    await datasource.saveTry('word3');

    final tries = await datasource.getTries();
    expect(
      tries,
      [const WordModel('word3')],
    );
  });
}
