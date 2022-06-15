import 'package:gword/app/modules/home/infra/models/word_model.dart';

abstract class IWordDatasource {
  Future<void> fetchWords();
  Future<WordModel> getCurrentWord();
  Future<void> saveTry(String wordTry);
  Future<List<WordModel>> getTries();
}
