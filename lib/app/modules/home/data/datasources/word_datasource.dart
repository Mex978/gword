import 'package:gword/app/modules/home/data/models/word_model.dart';

abstract class IWordDatasource {
  Future<WordModel> getCurrentWord();
}
