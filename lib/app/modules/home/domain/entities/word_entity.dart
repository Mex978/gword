import 'package:equatable/equatable.dart';
import 'package:gword/app/core/config/app/app_config.dart';
import 'package:gword/app/modules/home/domain/enums/word_enums.dart';

class WordEntity extends Equatable {
  final String word;

  const WordEntity(this.word);

  List<String> get characters => word.split('');

  bool get isValidWord => word.isNotEmpty && word.length == AppConfig.wordValidLength;

  List<LetterTryResult> compareTo(WordEntity other) {
    if (this == other) return List.generate(word.length, (index) => LetterTryResult.correct);

    final letters = <LetterTryResult>[];

    Map<int, String> currentWordPossibleLettersMap = Map.of(characters.asMap());
    final currentWordPossibleLettersEntries = currentWordPossibleLettersMap.entries.toList();

    for (MapEntry<int, String> entry in currentWordPossibleLettersEntries) {
      final index = entry.key;
      final letter = entry.value;

      if (letter == other.characters[index]) {
        letters.add(LetterTryResult.correct);
      } else if (currentWordPossibleLettersMap.values.contains(other.characters[index])) {
        letters.add(LetterTryResult.almost);
      } else {
        letters.add(LetterTryResult.incorrect);
      }

      currentWordPossibleLettersMap.remove(index);
    }

    return letters;
  }

  @override
  List<Object?> get props => [word];
}
