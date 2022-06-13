import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/modules/home/data/datasources/local_files/local_files_implementation.dart';
import 'package:gword/app/modules/home/data/datasources/word_datasource.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late IWordDatasource datasource;

  setUp(() {
    datasource = LocalFilesImplementation();
  });

  test('should return a single word when calls datasource', () async {
    final word = await datasource.getCurrentWord();

    expect(word.word, isNotNull);
    expect(word.word, isNotEmpty);
    expect(word.isValidWord, true);
  });
}
