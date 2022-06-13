import 'package:gword/app/modules/home/domain/entities/word_entity.dart';

class WordModel extends WordEntity {
  const WordModel(String word) : super(word);

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(json['word']);
  }

  Map<String, dynamic> toJson() {
    return {'word': word};
  }
}
