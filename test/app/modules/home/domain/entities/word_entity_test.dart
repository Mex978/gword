import 'package:flutter_test/flutter_test.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';
import 'package:gword/app/modules/home/domain/enums/word_enums.dart';

void main() {
  late WordEntity tValidWordEntity;

  setUp(() {
    tValidWordEntity = const WordEntity('tests');
  });

  test('should return a corrent word entity', () {
    WordEntity word = const WordEntity('tests');
    expect(word, tValidWordEntity);
  });

  test('should check correctly word entity attributes', () {
    expect(tValidWordEntity.word, 'tests');
    expect(tValidWordEntity.characters, ['t', 'e', 's', 't', 's']);
    expect(tValidWordEntity.isValidWord, true);
  });

  test('should return false when get a word with characters length lower then five', () {
    WordEntity word = const WordEntity('test');
    expect(word.isValidWord, false);
  });

  test('should return false when get a word with characters length more then five', () {
    WordEntity word = const WordEntity('testing');
    expect(word.isValidWord, false);
  });

  test('should return false when get a empty word', () {
    WordEntity word = const WordEntity('');
    expect(word.isValidWord, false);
  });

  test('should validate word as completly corret', () async {
    final result = tValidWordEntity.compareTo(tValidWordEntity);

    expect(
      result,
      <LetterTryResult>[
        LetterTryResult.correct,
        LetterTryResult.correct,
        LetterTryResult.correct,
        LetterTryResult.correct,
        LetterTryResult.correct,
      ],
    );
  });

  test('should validate word with once error', () async {
    final result = tValidWordEntity.compareTo(const WordEntity('testa'));

    expect(
      result,
      <LetterTryResult>[
        LetterTryResult.correct,
        LetterTryResult.correct,
        LetterTryResult.correct,
        LetterTryResult.correct,
        LetterTryResult.incorrect,
      ],
    );
  });

  test('should throw an error when try to compare invalid words', () async {
    expect(() => tValidWordEntity.compareTo(const WordEntity('test')), throwsA(isA<RangeError>()));
  });
}
